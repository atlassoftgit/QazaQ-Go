import { forwardRef, Inject, Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { CouponEntity } from "@ridy/database/coupon.entity";
import { RiderRechargeTransactionType } from "@ridy/database/enums/rider-recharge-transaction-type.enum";
import { TransactionAction } from "@ridy/database/enums/transaction-action.enum";
import { TransactionStatus } from "@ridy/database/enums/transaction-status.enum";
import { GiftCardEntity } from "@ridy/database/gift-card.entity";
import { RequestEntity } from "@ridy/database/request.entity";
import { SharedOrderService } from "@ridy/order/shared-order.service";
import { SharedRiderService } from "@ridy/order/shared-rider.service";
import { ForbiddenError } from "apollo-server-core";
import { Repository } from "typeorm";
import { OrderDTO } from "../order/dto/order.dto";
import { RiderOrderService } from "../order/rider-order.service";
import { RiderWalletDTO } from "../wallet/dto/rider-wallet.dto";

@Injectable()
export class CouponService {
    constructor(
        @InjectRepository(CouponEntity)
        private couponRepo: Repository<CouponEntity>,
        @InjectRepository(CouponEntity)
        private giftCardRepo: Repository<GiftCardEntity>,
        @InjectRepository(RequestEntity)
        private requestRepo: Repository<RequestEntity>,
        private orderService: RiderOrderService,
        private sharedOrderService: SharedOrderService,
        private sharedRiderService: SharedRiderService
    ) { }

    async checkCoupon(code: string, riderId?: number): Promise<CouponEntity> {
        const coupon = await this.couponRepo.findOne({ code });
        if (coupon == null) {
            throw new ForbiddenError('Incorrect code.');
        }
        if (coupon.expireAt < new Date()) {
            throw new ForbiddenError('Coupon expired');
        }
        if (riderId != null) {
            const requestsWithCoupon = await this.requestRepo.count({ where: { riderId, couponId: coupon.id } });
            if (requestsWithCoupon >= coupon.manyTimesUserCanUse) {
                throw new ForbiddenError('Coupon already used.');
            }
        }

        if (!coupon.isEnabled) {
            throw new ForbiddenError('Coupon is disabled.');
        }
        const timesCouponUsed = await this.requestRepo.count({ couponId: coupon.id });
        if (timesCouponUsed >= coupon.manyUsersCanUse) {
            throw new ForbiddenError('Coupon usage limit exceeded.');
        }
        return coupon;
    }

    async applyCoupon(code: string, riderId: number): Promise<OrderDTO> {
        const coupon = await this.checkCoupon(code, riderId);
        let request = await this.orderService.getCurrentOrder(riderId, ['service']);
        const finalCost = this.sharedOrderService.applyCouponOnPrice(coupon, (request.costBest + request.waitMinutes * request.service.perMinuteWait));
        await this.requestRepo.update(request.id, { couponId: coupon.id, costAfterCoupon: finalCost });
        request = await this.requestRepo.findOne(request.id);
        return request;
    }

    async redeemGiftCard(code: string, riderId: number): Promise<RiderWalletDTO> {
        const card = await this.giftCardRepo.findOne({ code });
        if (card == null) throw new ForbiddenError('Invalid code');
        await this.giftCardRepo.update(card.id, { isUsed: true });
        return this.sharedRiderService.rechargeWallet({
            riderId,
            action: TransactionAction.Recharge,
            rechargeType: RiderRechargeTransactionType.Gift,
            status: TransactionStatus.Done,
            currency: card.currency,
            amount: card.amount,
            giftCardId: card.id
        });
    }
}
import { QueryService } from '@nestjs-query/core';
import { InjectPubSub } from '@nestjs-query/query-graphql';
import { TypeOrmQueryService } from '@nestjs-query/query-typeorm';
import { Inject, Logger } from '@nestjs/common';
import { CONTEXT } from '@nestjs/graphql';
import { InjectRepository } from '@nestjs/typeorm';
import { DriverStatus } from '@ridy/database/enums/driver-status.enum';
import { OrderStatus } from '@ridy/database/enums/order-status.enum';
import { RequestActivityType } from '@ridy/database/enums/request-activity-type.enum';
import { RequestActivityEntity } from '@ridy/database/request-activity.entity';
import { RequestEntity } from '@ridy/database/request.entity';
import { RiderNotificationService } from '@ridy/order/firebase-notification-service/rider-notification.service';
import { GoogleServicesService } from '@ridy/order/google-services/google-services.service';
import { ServiceService } from '@ridy/order/service.service';
import { SharedDriverService } from '@ridy/order/shared-driver.service';
import { SharedOrderService } from '@ridy/order/shared-order.service';
import { DriverRedisService } from '@ridy/redis/driver-redis.service';
import { OrderRedisService } from '@ridy/redis/order-redis.service';
import { ForbiddenError } from 'apollo-server-core';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { Repository } from 'typeorm';

import { UserContext } from '../auth/authenticated-user';
import { UpdateOrderInput } from './dto/update-order.input';
import { RiderOrderService } from './rider-order.service';

@QueryService(RequestEntity)
export class RiderOrderQueryService extends TypeOrmQueryService<RequestEntity> {

    constructor(
        @InjectRepository(RequestEntity)
        public orderRepository: Repository<RequestEntity>,
        private orderService: RiderOrderService,
        private sharedOrderService: SharedOrderService,
        @InjectPubSub()
        private pubSub: RedisPubSub
    ) {
        super(orderRepository);
    }

    async updateOne(id: number, update: UpdateOrderInput): Promise<RequestEntity> {
        const order = await this.orderRepository.findOne(id, { relations: ['service', 'coupon'] });
        if (update.status != null && update.status != OrderStatus.RiderCanceled) {
            throw new ForbiddenError('Update status to this is not possible');
        }
        if (update.status != null) {
            await this.orderService.cancelOrder(id);
        }
        let costAfterCoupon = order.costAfterCoupon;
        if (update.waitMinutes != null) {
            costAfterCoupon = this.sharedOrderService.applyCouponOnPrice(order.coupon, order.costBest + (order.service.perMinuteWait * update.waitMinutes));
        }

        const result = await super.updateOne(id, { ...update, costAfterCoupon });
        this.pubSub.publish('orderUpdated', { orderUpdated: result });
        return result;
    }
}
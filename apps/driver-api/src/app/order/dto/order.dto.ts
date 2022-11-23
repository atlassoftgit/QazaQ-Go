import { Authorize, FilterableField, IDField, Relation, UnPagedRelation } from "@nestjs-query/query-graphql";
import { Field, ID, Int, ObjectType } from "@nestjs/graphql";
import { Point } from "@ridy/database";
import { OrderStatus } from "@ridy/database/enums/order-status.enum";
import { UserContext } from "../../auth/authenticated-user";
import { RiderDTO } from "./rider.dto";
import { ServiceDTO } from "../../service/dto/service.dto";
import { OrderMessageDTO } from "../../chat/dto/order-message.dto";
import { DriverDTO } from "../../driver/dto/driver.dto";
import { ServiceOptionDTO } from "./service-option.dto";

@ObjectType('Order')
@Authorize({
    authorize: (context: UserContext) => ({driverId: {eq: context.req.user.id}} as unknown)
})
@Relation('driver', () => DriverDTO)
@Relation('rider', () => RiderDTO)
@Relation('service', () => ServiceDTO)
@UnPagedRelation('options', () => ServiceOptionDTO)
@UnPagedRelation('conversation', () => OrderMessageDTO, { relationName: 'conversation' })
export class OrderDTO {
    @IDField(() => ID)
    id: number;
    @FilterableField(() => OrderStatus)
    status: OrderStatus;
    @FilterableField()
    createdOn: Date;
    @Field(() => Int)
    distanceBest!: number;
    @Field(() => Int)
    durationBest!: number;
    startTimestamp?: Date;
    finishTimestamp?: Date;
    etaPickup?: Date;
    waitMinutes!: number;
    expectedTimestamp: Date;
    @FilterableField()
    costBest: number;
    costAfterCoupon: number;
    paidAmount: number;
    currency!: string;
    @FilterableField(() => ID, { filterOnly: true })
    driverId?: number;
    addresses: string[];
    points: Point[];
    paymentGatewayId?: number;
}
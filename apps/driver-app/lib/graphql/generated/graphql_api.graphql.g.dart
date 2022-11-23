// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcements$Query$Announcement _$Announcements$Query$AnnouncementFromJson(
        Map<String, dynamic> json) =>
    Announcements$Query$Announcement()
      ..title = json['title'] as String
      ..description = json['description'] as String
      ..startAt = fromGraphQLTimestampToDartDateTime(json['startAt'] as int);

Map<String, dynamic> _$Announcements$Query$AnnouncementToJson(
        Announcements$Query$Announcement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'startAt': fromDartDateTimeToGraphQLTimestamp(instance.startAt),
    };

Announcements$Query _$Announcements$QueryFromJson(Map<String, dynamic> json) =>
    Announcements$Query()
      ..announcements = (json['announcements'] as List<dynamic>)
          .map((e) => Announcements$Query$Announcement.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Announcements$QueryToJson(
        Announcements$Query instance) =>
    <String, dynamic>{
      'announcements': instance.announcements.map((e) => e.toJson()).toList(),
    };

GetMessages$Query$Driver$DriverOrdersConnection$Order$Rider
    _$GetMessages$Query$Driver$DriverOrdersConnection$Order$RiderFromJson(
            Map<String, dynamic> json) =>
        GetMessages$Query$Driver$DriverOrdersConnection$Order$Rider()
          ..id = json['id'] as String
          ..firstName = json['firstName'] as String?
          ..lastName = json['lastName'] as String?
          ..media = json['media'] == null
              ? null
              : ChatRiderMixin$Media.fromJson(
                  json['media'] as Map<String, dynamic>)
          ..mobileNumber = json['mobileNumber'] as String;

Map<String, dynamic>
    _$GetMessages$Query$Driver$DriverOrdersConnection$Order$RiderToJson(
            GetMessages$Query$Driver$DriverOrdersConnection$Order$Rider
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'firstName': instance.firstName,
          'lastName': instance.lastName,
          'media': instance.media?.toJson(),
          'mobileNumber': instance.mobileNumber,
        };

GetMessages$Query$Driver$DriverOrdersConnection$Order$Driver
    _$GetMessages$Query$Driver$DriverOrdersConnection$Order$DriverFromJson(
            Map<String, dynamic> json) =>
        GetMessages$Query$Driver$DriverOrdersConnection$Order$Driver()
          ..id = json['id'] as String
          ..firstName = json['firstName'] as String?
          ..lastName = json['lastName'] as String?
          ..media = json['media'] == null
              ? null
              : ChatDriverMixin$Media.fromJson(
                  json['media'] as Map<String, dynamic>);

Map<String, dynamic>
    _$GetMessages$Query$Driver$DriverOrdersConnection$Order$DriverToJson(
            GetMessages$Query$Driver$DriverOrdersConnection$Order$Driver
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'firstName': instance.firstName,
          'lastName': instance.lastName,
          'media': instance.media?.toJson(),
        };

GetMessages$Query$Driver$DriverOrdersConnection$Order$OrderMessage
    _$GetMessages$Query$Driver$DriverOrdersConnection$Order$OrderMessageFromJson(
            Map<String, dynamic> json) =>
        GetMessages$Query$Driver$DriverOrdersConnection$Order$OrderMessage()
          ..id = json['id'] as String
          ..content = json['content'] as String
          ..sentByDriver = json['sentByDriver'] as bool;

Map<String, dynamic>
    _$GetMessages$Query$Driver$DriverOrdersConnection$Order$OrderMessageToJson(
            GetMessages$Query$Driver$DriverOrdersConnection$Order$OrderMessage
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'content': instance.content,
          'sentByDriver': instance.sentByDriver,
        };

GetMessages$Query$Driver$DriverOrdersConnection$Order
    _$GetMessages$Query$Driver$DriverOrdersConnection$OrderFromJson(
            Map<String, dynamic> json) =>
        GetMessages$Query$Driver$DriverOrdersConnection$Order()
          ..id = json['id'] as String
          ..rider = GetMessages$Query$Driver$DriverOrdersConnection$Order$Rider
              .fromJson(json['rider'] as Map<String, dynamic>)
          ..driver =
              GetMessages$Query$Driver$DriverOrdersConnection$Order$Driver
                  .fromJson(json['driver'] as Map<String, dynamic>)
          ..conversations = (json['conversations'] as List<dynamic>)
              .map((e) =>
                  GetMessages$Query$Driver$DriverOrdersConnection$Order$OrderMessage
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic>
    _$GetMessages$Query$Driver$DriverOrdersConnection$OrderToJson(
            GetMessages$Query$Driver$DriverOrdersConnection$Order instance) =>
        <String, dynamic>{
          'id': instance.id,
          'rider': instance.rider.toJson(),
          'driver': instance.driver.toJson(),
          'conversations':
              instance.conversations.map((e) => e.toJson()).toList(),
        };

GetMessages$Query$Driver$DriverOrdersConnection
    _$GetMessages$Query$Driver$DriverOrdersConnectionFromJson(
            Map<String, dynamic> json) =>
        GetMessages$Query$Driver$DriverOrdersConnection()
          ..nodes = (json['nodes'] as List<dynamic>)
              .map((e) => GetMessages$Query$Driver$DriverOrdersConnection$Order
                  .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetMessages$Query$Driver$DriverOrdersConnectionToJson(
        GetMessages$Query$Driver$DriverOrdersConnection instance) =>
    <String, dynamic>{
      'nodes': instance.nodes.map((e) => e.toJson()).toList(),
    };

GetMessages$Query$Driver _$GetMessages$Query$DriverFromJson(
        Map<String, dynamic> json) =>
    GetMessages$Query$Driver()
      ..orders = GetMessages$Query$Driver$DriverOrdersConnection.fromJson(
          json['orders'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMessages$Query$DriverToJson(
        GetMessages$Query$Driver instance) =>
    <String, dynamic>{
      'orders': instance.orders.toJson(),
    };

GetMessages$Query _$GetMessages$QueryFromJson(Map<String, dynamic> json) =>
    GetMessages$Query()
      ..driver = json['driver'] == null
          ? null
          : GetMessages$Query$Driver.fromJson(
              json['driver'] as Map<String, dynamic>);

Map<String, dynamic> _$GetMessages$QueryToJson(GetMessages$Query instance) =>
    <String, dynamic>{
      'driver': instance.driver?.toJson(),
    };

DeleteUser$Mutation$Driver _$DeleteUser$Mutation$DriverFromJson(
        Map<String, dynamic> json) =>
    DeleteUser$Mutation$Driver()..id = json['id'] as String;

Map<String, dynamic> _$DeleteUser$Mutation$DriverToJson(
        DeleteUser$Mutation$Driver instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

DeleteUser$Mutation _$DeleteUser$MutationFromJson(Map<String, dynamic> json) =>
    DeleteUser$Mutation()
      ..deleteUser = DeleteUser$Mutation$Driver.fromJson(
          json['deleteUser'] as Map<String, dynamic>);

Map<String, dynamic> _$DeleteUser$MutationToJson(
        DeleteUser$Mutation instance) =>
    <String, dynamic>{
      'deleteUser': instance.deleteUser.toJson(),
    };

ChatRiderMixin$Media _$ChatRiderMixin$MediaFromJson(
        Map<String, dynamic> json) =>
    ChatRiderMixin$Media()..address = json['address'] as String;

Map<String, dynamic> _$ChatRiderMixin$MediaToJson(
        ChatRiderMixin$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

ChatDriverMixin$Media _$ChatDriverMixin$MediaFromJson(
        Map<String, dynamic> json) =>
    ChatDriverMixin$Media()..address = json['address'] as String;

Map<String, dynamic> _$ChatDriverMixin$MediaToJson(
        ChatDriverMixin$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

SendMessage$Mutation$OrderMessage _$SendMessage$Mutation$OrderMessageFromJson(
        Map<String, dynamic> json) =>
    SendMessage$Mutation$OrderMessage()
      ..id = json['id'] as String
      ..content = json['content'] as String
      ..sentByDriver = json['sentByDriver'] as bool;

Map<String, dynamic> _$SendMessage$Mutation$OrderMessageToJson(
        SendMessage$Mutation$OrderMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sentByDriver': instance.sentByDriver,
    };

SendMessage$Mutation _$SendMessage$MutationFromJson(
        Map<String, dynamic> json) =>
    SendMessage$Mutation()
      ..createOneOrderMessage = SendMessage$Mutation$OrderMessage.fromJson(
          json['createOneOrderMessage'] as Map<String, dynamic>);

Map<String, dynamic> _$SendMessage$MutationToJson(
        SendMessage$Mutation instance) =>
    <String, dynamic>{
      'createOneOrderMessage': instance.createOneOrderMessage.toJson(),
    };

NewMessageReceived$Subscription$OrderMessage
    _$NewMessageReceived$Subscription$OrderMessageFromJson(
            Map<String, dynamic> json) =>
        NewMessageReceived$Subscription$OrderMessage()
          ..id = json['id'] as String
          ..content = json['content'] as String
          ..sentByDriver = json['sentByDriver'] as bool;

Map<String, dynamic> _$NewMessageReceived$Subscription$OrderMessageToJson(
        NewMessageReceived$Subscription$OrderMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sentByDriver': instance.sentByDriver,
    };

NewMessageReceived$Subscription _$NewMessageReceived$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    NewMessageReceived$Subscription()
      ..newMessageReceived =
          NewMessageReceived$Subscription$OrderMessage.fromJson(
              json['newMessageReceived'] as Map<String, dynamic>);

Map<String, dynamic> _$NewMessageReceived$SubscriptionToJson(
        NewMessageReceived$Subscription instance) =>
    <String, dynamic>{
      'newMessageReceived': instance.newMessageReceived.toJson(),
    };

GetStats$Query$StatisticsResult$Datapoint
    _$GetStats$Query$StatisticsResult$DatapointFromJson(
            Map<String, dynamic> json) =>
        GetStats$Query$StatisticsResult$Datapoint()
          ..count = (json['count'] as num).toDouble()
          ..current = json['current'] as String
          ..distance = (json['distance'] as num).toDouble()
          ..earning = (json['earning'] as num).toDouble()
          ..name = json['name'] as String
          ..time = (json['time'] as num).toDouble();

Map<String, dynamic> _$GetStats$Query$StatisticsResult$DatapointToJson(
        GetStats$Query$StatisticsResult$Datapoint instance) =>
    <String, dynamic>{
      'count': instance.count,
      'current': instance.current,
      'distance': instance.distance,
      'earning': instance.earning,
      'name': instance.name,
      'time': instance.time,
    };

GetStats$Query$StatisticsResult _$GetStats$Query$StatisticsResultFromJson(
        Map<String, dynamic> json) =>
    GetStats$Query$StatisticsResult()
      ..currency = json['currency'] as String
      ..dataset = (json['dataset'] as List<dynamic>)
          .map((e) => GetStats$Query$StatisticsResult$Datapoint.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetStats$Query$StatisticsResultToJson(
        GetStats$Query$StatisticsResult instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'dataset': instance.dataset.map((e) => e.toJson()).toList(),
    };

GetStats$Query$OrderConnection _$GetStats$Query$OrderConnectionFromJson(
        Map<String, dynamic> json) =>
    GetStats$Query$OrderConnection()
      ..edges = (json['edges'] as List<dynamic>)
          .map((e) => HistoryOrderItemMixin$OrderEdge.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..pageInfo = HistoryOrderItemMixin$PageInfo.fromJson(
          json['pageInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$GetStats$Query$OrderConnectionToJson(
        GetStats$Query$OrderConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
      'pageInfo': instance.pageInfo.toJson(),
    };

GetStats$Query$OrderAggregateResponse$OrderAggregateGroupBy
    _$GetStats$Query$OrderAggregateResponse$OrderAggregateGroupByFromJson(
            Map<String, dynamic> json) =>
        GetStats$Query$OrderAggregateResponse$OrderAggregateGroupBy()
          ..createdOn = fromGraphQLTimestampNullableToDartDateTimeNullable(
              json['createdOn'] as int?);

Map<String, dynamic>
    _$GetStats$Query$OrderAggregateResponse$OrderAggregateGroupByToJson(
            GetStats$Query$OrderAggregateResponse$OrderAggregateGroupBy
                instance) =>
        <String, dynamic>{
          'createdOn': fromDartDateTimeNullableToGraphQLTimestampNullable(
              instance.createdOn),
        };

GetStats$Query$OrderAggregateResponse$OrderCountAggregate
    _$GetStats$Query$OrderAggregateResponse$OrderCountAggregateFromJson(
            Map<String, dynamic> json) =>
        GetStats$Query$OrderAggregateResponse$OrderCountAggregate()
          ..id = json['id'] as int?;

Map<String,
    dynamic> _$GetStats$Query$OrderAggregateResponse$OrderCountAggregateToJson(
        GetStats$Query$OrderAggregateResponse$OrderCountAggregate instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetStats$Query$OrderAggregateResponse$OrderSumAggregate
    _$GetStats$Query$OrderAggregateResponse$OrderSumAggregateFromJson(
            Map<String, dynamic> json) =>
        GetStats$Query$OrderAggregateResponse$OrderSumAggregate()
          ..costBest = (json['costBest'] as num?)?.toDouble();

Map<String, dynamic>
    _$GetStats$Query$OrderAggregateResponse$OrderSumAggregateToJson(
            GetStats$Query$OrderAggregateResponse$OrderSumAggregate instance) =>
        <String, dynamic>{
          'costBest': instance.costBest,
        };

GetStats$Query$OrderAggregateResponse
    _$GetStats$Query$OrderAggregateResponseFromJson(
            Map<String, dynamic> json) =>
        GetStats$Query$OrderAggregateResponse()
          ..groupBy = json['groupBy'] == null
              ? null
              : GetStats$Query$OrderAggregateResponse$OrderAggregateGroupBy
                  .fromJson(json['groupBy'] as Map<String, dynamic>)
          ..count = json['count'] == null
              ? null
              : GetStats$Query$OrderAggregateResponse$OrderCountAggregate
                  .fromJson(json['count'] as Map<String, dynamic>)
          ..sum = json['sum'] == null
              ? null
              : GetStats$Query$OrderAggregateResponse$OrderSumAggregate
                  .fromJson(json['sum'] as Map<String, dynamic>);

Map<String, dynamic> _$GetStats$Query$OrderAggregateResponseToJson(
        GetStats$Query$OrderAggregateResponse instance) =>
    <String, dynamic>{
      'groupBy': instance.groupBy?.toJson(),
      'count': instance.count?.toJson(),
      'sum': instance.sum?.toJson(),
    };

GetStats$Query _$GetStats$QueryFromJson(Map<String, dynamic> json) =>
    GetStats$Query()
      ..getStatsNew = GetStats$Query$StatisticsResult.fromJson(
          json['getStatsNew'] as Map<String, dynamic>)
      ..orders = GetStats$Query$OrderConnection.fromJson(
          json['orders'] as Map<String, dynamic>)
      ..orderAggregate = (json['orderAggregate'] as List<dynamic>)
          .map((e) => GetStats$Query$OrderAggregateResponse.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetStats$QueryToJson(GetStats$Query instance) =>
    <String, dynamic>{
      'getStatsNew': instance.getStatsNew.toJson(),
      'orders': instance.orders.toJson(),
      'orderAggregate': instance.orderAggregate.map((e) => e.toJson()).toList(),
    };

HistoryOrderItemMixin$OrderEdge$Order$Service
    _$HistoryOrderItemMixin$OrderEdge$Order$ServiceFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order$Service()
          ..name = json['name'] as String;

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdge$Order$ServiceToJson(
        HistoryOrderItemMixin$OrderEdge$Order$Service instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

HistoryOrderItemMixin$OrderEdge$Order
    _$HistoryOrderItemMixin$OrderEdge$OrderFromJson(
            Map<String, dynamic> json) =>
        HistoryOrderItemMixin$OrderEdge$Order()
          ..id = json['id'] as String
          ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
              unknownValue: OrderStatus.artemisUnknown)
          ..createdOn =
              fromGraphQLTimestampToDartDateTime(json['createdOn'] as int)
          ..currency = json['currency'] as String
          ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
          ..service = HistoryOrderItemMixin$OrderEdge$Order$Service.fromJson(
              json['service'] as Map<String, dynamic>);

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdge$OrderToJson(
        HistoryOrderItemMixin$OrderEdge$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'createdOn': fromDartDateTimeToGraphQLTimestamp(instance.createdOn),
      'currency': instance.currency,
      'costAfterCoupon': instance.costAfterCoupon,
      'service': instance.service.toJson(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.requested: 'Requested',
  OrderStatus.notFound: 'NotFound',
  OrderStatus.noCloseFound: 'NoCloseFound',
  OrderStatus.found: 'Found',
  OrderStatus.driverAccepted: 'DriverAccepted',
  OrderStatus.arrived: 'Arrived',
  OrderStatus.waitingForPrePay: 'WaitingForPrePay',
  OrderStatus.driverCanceled: 'DriverCanceled',
  OrderStatus.riderCanceled: 'RiderCanceled',
  OrderStatus.started: 'Started',
  OrderStatus.waitingForPostPay: 'WaitingForPostPay',
  OrderStatus.waitingForReview: 'WaitingForReview',
  OrderStatus.finished: 'Finished',
  OrderStatus.booked: 'Booked',
  OrderStatus.expired: 'Expired',
  OrderStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

HistoryOrderItemMixin$OrderEdge _$HistoryOrderItemMixin$OrderEdgeFromJson(
        Map<String, dynamic> json) =>
    HistoryOrderItemMixin$OrderEdge()
      ..node = HistoryOrderItemMixin$OrderEdge$Order.fromJson(
          json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$HistoryOrderItemMixin$OrderEdgeToJson(
        HistoryOrderItemMixin$OrderEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
    };

HistoryOrderItemMixin$PageInfo _$HistoryOrderItemMixin$PageInfoFromJson(
        Map<String, dynamic> json) =>
    HistoryOrderItemMixin$PageInfo()
      ..hasNextPage = json['hasNextPage'] as bool?
      ..endCursor = fromGraphQLConnectionCursorNullableToDartStringNullable(
          json['endCursor'] as String?)
      ..startCursor = fromGraphQLConnectionCursorNullableToDartStringNullable(
          json['startCursor'] as String?)
      ..hasPreviousPage = json['hasPreviousPage'] as bool?;

Map<String, dynamic> _$HistoryOrderItemMixin$PageInfoToJson(
        HistoryOrderItemMixin$PageInfo instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'endCursor': fromDartStringNullableToGraphQLConnectionCursorNullable(
          instance.endCursor),
      'startCursor': fromDartStringNullableToGraphQLConnectionCursorNullable(
          instance.startCursor),
      'hasPreviousPage': instance.hasPreviousPage,
    };

Me$Query$Driver _$Me$Query$DriverFromJson(Map<String, dynamic> json) =>
    Me$Query$Driver()
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..searchDistance = json['searchDistance'] as int?
      ..media = json['media'] == null
          ? null
          : BasicProfileMixin$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..softRejectionNote = json['softRejectionNote'] as String?
      ..status = $enumDecode(_$DriverStatusEnumMap, json['status'],
          unknownValue: DriverStatus.artemisUnknown)
      ..currentOrders = (json['currentOrders'] as List<dynamic>)
          .map((e) =>
              BasicProfileMixin$Order.fromJson(e as Map<String, dynamic>))
          .toList()
      ..wallets = (json['wallets'] as List<dynamic>)
          .map((e) => BasicProfileMixin$DriverWallet.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Me$Query$DriverToJson(Me$Query$Driver instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'searchDistance': instance.searchDistance,
      'media': instance.media?.toJson(),
      'softRejectionNote': instance.softRejectionNote,
      'status': _$DriverStatusEnumMap[instance.status],
      'currentOrders': instance.currentOrders.map((e) => e.toJson()).toList(),
      'wallets': instance.wallets.map((e) => e.toJson()).toList(),
    };

const _$DriverStatusEnumMap = {
  DriverStatus.online: 'Online',
  DriverStatus.offline: 'Offline',
  DriverStatus.blocked: 'Blocked',
  DriverStatus.inService: 'InService',
  DriverStatus.waitingDocuments: 'WaitingDocuments',
  DriverStatus.pendingApproval: 'PendingApproval',
  DriverStatus.softReject: 'SoftReject',
  DriverStatus.hardReject: 'HardReject',
  DriverStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

Me$Query _$Me$QueryFromJson(Map<String, dynamic> json) => Me$Query()
  ..driver = json['driver'] == null
      ? null
      : Me$Query$Driver.fromJson(json['driver'] as Map<String, dynamic>)
  ..requireUpdate = $enumDecode(_$VersionStatusEnumMap, json['requireUpdate'],
      unknownValue: VersionStatus.artemisUnknown);

Map<String, dynamic> _$Me$QueryToJson(Me$Query instance) => <String, dynamic>{
      'driver': instance.driver?.toJson(),
      'requireUpdate': _$VersionStatusEnumMap[instance.requireUpdate],
    };

const _$VersionStatusEnumMap = {
  VersionStatus.latest: 'Latest',
  VersionStatus.mandatoryUpdate: 'MandatoryUpdate',
  VersionStatus.optionalUpdate: 'OptionalUpdate',
  VersionStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

BasicProfileMixin$Media _$BasicProfileMixin$MediaFromJson(
        Map<String, dynamic> json) =>
    BasicProfileMixin$Media()..address = json['address'] as String;

Map<String, dynamic> _$BasicProfileMixin$MediaToJson(
        BasicProfileMixin$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

BasicProfileMixin$Order _$BasicProfileMixin$OrderFromJson(
        Map<String, dynamic> json) =>
    BasicProfileMixin$Order()
      ..id = json['id'] as String
      ..createdOn = fromGraphQLTimestampToDartDateTime(json['createdOn'] as int)
      ..expectedTimestamp =
          fromGraphQLTimestampToDartDateTime(json['expectedTimestamp'] as int)
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..currency = json['currency'] as String
      ..costBest = (json['costBest'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..options = (json['options'] as List<dynamic>)
          .map((e) => CurrentOrderMixin$ServiceOption.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..rider = CurrentOrderMixin$Rider.fromJson(
          json['rider'] as Map<String, dynamic>);

Map<String, dynamic> _$BasicProfileMixin$OrderToJson(
        BasicProfileMixin$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdOn': fromDartDateTimeToGraphQLTimestamp(instance.createdOn),
      'expectedTimestamp':
          fromDartDateTimeToGraphQLTimestamp(instance.expectedTimestamp),
      'status': _$OrderStatusEnumMap[instance.status],
      'currency': instance.currency,
      'costBest': instance.costBest,
      'costAfterCoupon': instance.costAfterCoupon,
      'paidAmount': instance.paidAmount,
      'etaPickup': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.etaPickup),
      'points': instance.points.map((e) => e.toJson()).toList(),
      'service': instance.service.toJson(),
      'options': instance.options.map((e) => e.toJson()).toList(),
      'addresses': instance.addresses,
      'rider': instance.rider.toJson(),
    };

BasicProfileMixin$DriverWallet _$BasicProfileMixin$DriverWalletFromJson(
        Map<String, dynamic> json) =>
    BasicProfileMixin$DriverWallet()
      ..balance = (json['balance'] as num).toDouble()
      ..currency = json['currency'] as String;

Map<String, dynamic> _$BasicProfileMixin$DriverWalletToJson(
        BasicProfileMixin$DriverWallet instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'currency': instance.currency,
    };

CurrentOrderMixin$Point _$CurrentOrderMixin$PointFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$CurrentOrderMixin$PointToJson(
        CurrentOrderMixin$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

CurrentOrderMixin$Service _$CurrentOrderMixin$ServiceFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Service()..name = json['name'] as String;

Map<String, dynamic> _$CurrentOrderMixin$ServiceToJson(
        CurrentOrderMixin$Service instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CurrentOrderMixin$ServiceOption _$CurrentOrderMixin$ServiceOptionFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$ServiceOption()
      ..id = json['id'] as String
      ..name = json['name'] as String
      ..icon = $enumDecode(_$ServiceOptionIconEnumMap, json['icon'],
          unknownValue: ServiceOptionIcon.artemisUnknown);

Map<String, dynamic> _$CurrentOrderMixin$ServiceOptionToJson(
        CurrentOrderMixin$ServiceOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': _$ServiceOptionIconEnumMap[instance.icon],
    };

const _$ServiceOptionIconEnumMap = {
  ServiceOptionIcon.pet: 'Pet',
  ServiceOptionIcon.twoWay: 'TwoWay',
  ServiceOptionIcon.luggage: 'Luggage',
  ServiceOptionIcon.packageDelivery: 'PackageDelivery',
  ServiceOptionIcon.shopping: 'Shopping',
  ServiceOptionIcon.custom1: 'Custom1',
  ServiceOptionIcon.custom2: 'Custom2',
  ServiceOptionIcon.custom3: 'Custom3',
  ServiceOptionIcon.custom4: 'Custom4',
  ServiceOptionIcon.custom5: 'Custom5',
  ServiceOptionIcon.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CurrentOrderMixin$Rider$Media _$CurrentOrderMixin$Rider$MediaFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Rider$Media()..address = json['address'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Rider$MediaToJson(
        CurrentOrderMixin$Rider$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

CurrentOrderMixin$Rider _$CurrentOrderMixin$RiderFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Rider()
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..media = json['media'] == null
          ? null
          : CurrentOrderMixin$Rider$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$CurrentOrderMixin$RiderToJson(
        CurrentOrderMixin$Rider instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'media': instance.media?.toJson(),
    };

AvailableOrders$Query$Order _$AvailableOrders$Query$OrderFromJson(
        Map<String, dynamic> json) =>
    AvailableOrders$Query$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..currency = json['currency'] as String
      ..costBest = (json['costBest'] as num).toDouble()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..distanceBest = json['distanceBest'] as int
      ..durationBest = json['durationBest'] as int
      ..options = (json['options'] as List<dynamic>)
          .map((e) => AvailableOrderMixin$ServiceOption.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..service = AvailableOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              AvailableOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AvailableOrders$Query$OrderToJson(
        AvailableOrders$Query$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'currency': instance.currency,
      'costBest': instance.costBest,
      'addresses': instance.addresses,
      'distanceBest': instance.distanceBest,
      'durationBest': instance.durationBest,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'service': instance.service.toJson(),
      'points': instance.points.map((e) => e.toJson()).toList(),
    };

AvailableOrders$Query _$AvailableOrders$QueryFromJson(
        Map<String, dynamic> json) =>
    AvailableOrders$Query()
      ..availableOrders = (json['availableOrders'] as List<dynamic>)
          .map((e) =>
              AvailableOrders$Query$Order.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AvailableOrders$QueryToJson(
        AvailableOrders$Query instance) =>
    <String, dynamic>{
      'availableOrders':
          instance.availableOrders.map((e) => e.toJson()).toList(),
    };

AvailableOrderMixin$ServiceOption _$AvailableOrderMixin$ServiceOptionFromJson(
        Map<String, dynamic> json) =>
    AvailableOrderMixin$ServiceOption()
      ..name = json['name'] as String
      ..icon = $enumDecode(_$ServiceOptionIconEnumMap, json['icon'],
          unknownValue: ServiceOptionIcon.artemisUnknown);

Map<String, dynamic> _$AvailableOrderMixin$ServiceOptionToJson(
        AvailableOrderMixin$ServiceOption instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': _$ServiceOptionIconEnumMap[instance.icon],
    };

AvailableOrderMixin$Service _$AvailableOrderMixin$ServiceFromJson(
        Map<String, dynamic> json) =>
    AvailableOrderMixin$Service()..name = json['name'] as String;

Map<String, dynamic> _$AvailableOrderMixin$ServiceToJson(
        AvailableOrderMixin$Service instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

AvailableOrderMixin$Point _$AvailableOrderMixin$PointFromJson(
        Map<String, dynamic> json) =>
    AvailableOrderMixin$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$AvailableOrderMixin$PointToJson(
        AvailableOrderMixin$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

OrderCreated$Subscription$Order _$OrderCreated$Subscription$OrderFromJson(
        Map<String, dynamic> json) =>
    OrderCreated$Subscription$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..currency = json['currency'] as String
      ..costBest = (json['costBest'] as num).toDouble()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..distanceBest = json['distanceBest'] as int
      ..durationBest = json['durationBest'] as int
      ..options = (json['options'] as List<dynamic>)
          .map((e) => AvailableOrderMixin$ServiceOption.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..service = AvailableOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              AvailableOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$OrderCreated$Subscription$OrderToJson(
        OrderCreated$Subscription$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'currency': instance.currency,
      'costBest': instance.costBest,
      'addresses': instance.addresses,
      'distanceBest': instance.distanceBest,
      'durationBest': instance.durationBest,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'service': instance.service.toJson(),
      'points': instance.points.map((e) => e.toJson()).toList(),
    };

OrderCreated$Subscription _$OrderCreated$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    OrderCreated$Subscription()
      ..orderCreated = OrderCreated$Subscription$Order.fromJson(
          json['orderCreated'] as Map<String, dynamic>);

Map<String, dynamic> _$OrderCreated$SubscriptionToJson(
        OrderCreated$Subscription instance) =>
    <String, dynamic>{
      'orderCreated': instance.orderCreated.toJson(),
    };

OrderRemoved$Subscription$Order _$OrderRemoved$Subscription$OrderFromJson(
        Map<String, dynamic> json) =>
    OrderRemoved$Subscription$Order()..id = json['id'] as String;

Map<String, dynamic> _$OrderRemoved$Subscription$OrderToJson(
        OrderRemoved$Subscription$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

OrderRemoved$Subscription _$OrderRemoved$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    OrderRemoved$Subscription()
      ..orderRemoved = OrderRemoved$Subscription$Order.fromJson(
          json['orderRemoved'] as Map<String, dynamic>);

Map<String, dynamic> _$OrderRemoved$SubscriptionToJson(
        OrderRemoved$Subscription instance) =>
    <String, dynamic>{
      'orderRemoved': instance.orderRemoved.toJson(),
    };

OrderUpdated$Subscription$Order _$OrderUpdated$Subscription$OrderFromJson(
        Map<String, dynamic> json) =>
    OrderUpdated$Subscription$Order()..id = json['id'] as String;

Map<String, dynamic> _$OrderUpdated$Subscription$OrderToJson(
        OrderUpdated$Subscription$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

OrderUpdated$Subscription _$OrderUpdated$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    OrderUpdated$Subscription()
      ..orderUpdated = OrderUpdated$Subscription$Order.fromJson(
          json['orderUpdated'] as Map<String, dynamic>);

Map<String, dynamic> _$OrderUpdated$SubscriptionToJson(
        OrderUpdated$Subscription instance) =>
    <String, dynamic>{
      'orderUpdated': instance.orderUpdated.toJson(),
    };

UpdateDriverLocation$Mutation$Order
    _$UpdateDriverLocation$Mutation$OrderFromJson(Map<String, dynamic> json) =>
        UpdateDriverLocation$Mutation$Order()
          ..id = json['id'] as String
          ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
              unknownValue: OrderStatus.artemisUnknown)
          ..currency = json['currency'] as String
          ..costBest = (json['costBest'] as num).toDouble()
          ..addresses = (json['addresses'] as List<dynamic>)
              .map((e) => e as String)
              .toList()
          ..distanceBest = json['distanceBest'] as int
          ..durationBest = json['durationBest'] as int
          ..options = (json['options'] as List<dynamic>)
              .map((e) => AvailableOrderMixin$ServiceOption.fromJson(
                  e as Map<String, dynamic>))
              .toList()
          ..service = AvailableOrderMixin$Service.fromJson(
              json['service'] as Map<String, dynamic>)
          ..points = (json['points'] as List<dynamic>)
              .map((e) =>
                  AvailableOrderMixin$Point.fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$UpdateDriverLocation$Mutation$OrderToJson(
        UpdateDriverLocation$Mutation$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'currency': instance.currency,
      'costBest': instance.costBest,
      'addresses': instance.addresses,
      'distanceBest': instance.distanceBest,
      'durationBest': instance.durationBest,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'service': instance.service.toJson(),
      'points': instance.points.map((e) => e.toJson()).toList(),
    };

UpdateDriverLocation$Mutation _$UpdateDriverLocation$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverLocation$Mutation()
      ..updateDriversLocationNew =
          (json['updateDriversLocationNew'] as List<dynamic>)
              .map((e) => UpdateDriverLocation$Mutation$Order.fromJson(
                  e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$UpdateDriverLocation$MutationToJson(
        UpdateDriverLocation$Mutation instance) =>
    <String, dynamic>{
      'updateDriversLocationNew':
          instance.updateDriversLocationNew.map((e) => e.toJson()).toList(),
    };

PointInput _$PointInputFromJson(Map<String, dynamic> json) => PointInput(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$PointInputToJson(PointInput instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

UpdateOrderStatus$Mutation$Order _$UpdateOrderStatus$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    UpdateOrderStatus$Mutation$Order()
      ..id = json['id'] as String
      ..createdOn = fromGraphQLTimestampToDartDateTime(json['createdOn'] as int)
      ..expectedTimestamp =
          fromGraphQLTimestampToDartDateTime(json['expectedTimestamp'] as int)
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..currency = json['currency'] as String
      ..costBest = (json['costBest'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..options = (json['options'] as List<dynamic>)
          .map((e) => CurrentOrderMixin$ServiceOption.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..rider = CurrentOrderMixin$Rider.fromJson(
          json['rider'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateOrderStatus$Mutation$OrderToJson(
        UpdateOrderStatus$Mutation$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdOn': fromDartDateTimeToGraphQLTimestamp(instance.createdOn),
      'expectedTimestamp':
          fromDartDateTimeToGraphQLTimestamp(instance.expectedTimestamp),
      'status': _$OrderStatusEnumMap[instance.status],
      'currency': instance.currency,
      'costBest': instance.costBest,
      'costAfterCoupon': instance.costAfterCoupon,
      'paidAmount': instance.paidAmount,
      'etaPickup': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.etaPickup),
      'points': instance.points.map((e) => e.toJson()).toList(),
      'service': instance.service.toJson(),
      'options': instance.options.map((e) => e.toJson()).toList(),
      'addresses': instance.addresses,
      'rider': instance.rider.toJson(),
    };

UpdateOrderStatus$Mutation _$UpdateOrderStatus$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateOrderStatus$Mutation()
      ..updateOneOrder = UpdateOrderStatus$Mutation$Order.fromJson(
          json['updateOneOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateOrderStatus$MutationToJson(
        UpdateOrderStatus$Mutation instance) =>
    <String, dynamic>{
      'updateOneOrder': instance.updateOneOrder.toJson(),
    };

UpdateDriverStatus$Mutation$Driver _$UpdateDriverStatus$Mutation$DriverFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverStatus$Mutation$Driver()
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..searchDistance = json['searchDistance'] as int?
      ..media = json['media'] == null
          ? null
          : BasicProfileMixin$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..softRejectionNote = json['softRejectionNote'] as String?
      ..status = $enumDecode(_$DriverStatusEnumMap, json['status'],
          unknownValue: DriverStatus.artemisUnknown)
      ..currentOrders = (json['currentOrders'] as List<dynamic>)
          .map((e) =>
              BasicProfileMixin$Order.fromJson(e as Map<String, dynamic>))
          .toList()
      ..wallets = (json['wallets'] as List<dynamic>)
          .map((e) => BasicProfileMixin$DriverWallet.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UpdateDriverStatus$Mutation$DriverToJson(
        UpdateDriverStatus$Mutation$Driver instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'searchDistance': instance.searchDistance,
      'media': instance.media?.toJson(),
      'softRejectionNote': instance.softRejectionNote,
      'status': _$DriverStatusEnumMap[instance.status],
      'currentOrders': instance.currentOrders.map((e) => e.toJson()).toList(),
      'wallets': instance.wallets.map((e) => e.toJson()).toList(),
    };

UpdateDriverStatus$Mutation _$UpdateDriverStatus$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverStatus$Mutation()
      ..updateOneDriver = UpdateDriverStatus$Mutation$Driver.fromJson(
          json['updateOneDriver'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateDriverStatus$MutationToJson(
        UpdateDriverStatus$Mutation instance) =>
    <String, dynamic>{
      'updateOneDriver': instance.updateOneDriver.toJson(),
    };

UpdateDriverSearchDistance$Mutation$Driver
    _$UpdateDriverSearchDistance$Mutation$DriverFromJson(
            Map<String, dynamic> json) =>
        UpdateDriverSearchDistance$Mutation$Driver()..id = json['id'] as String;

Map<String, dynamic> _$UpdateDriverSearchDistance$Mutation$DriverToJson(
        UpdateDriverSearchDistance$Mutation$Driver instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateDriverSearchDistance$Mutation
    _$UpdateDriverSearchDistance$MutationFromJson(Map<String, dynamic> json) =>
        UpdateDriverSearchDistance$Mutation()
          ..updateOneDriver =
              UpdateDriverSearchDistance$Mutation$Driver.fromJson(
                  json['updateOneDriver'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateDriverSearchDistance$MutationToJson(
        UpdateDriverSearchDistance$Mutation instance) =>
    <String, dynamic>{
      'updateOneDriver': instance.updateOneDriver.toJson(),
    };

UpdateProfile$Mutation$Driver _$UpdateProfile$Mutation$DriverFromJson(
        Map<String, dynamic> json) =>
    UpdateProfile$Mutation$Driver()..id = json['id'] as String;

Map<String, dynamic> _$UpdateProfile$Mutation$DriverToJson(
        UpdateProfile$Mutation$Driver instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateProfile$Mutation _$UpdateProfile$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateProfile$Mutation()
      ..updateOneDriver = UpdateProfile$Mutation$Driver.fromJson(
          json['updateOneDriver'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateProfile$MutationToJson(
        UpdateProfile$Mutation instance) =>
    <String, dynamic>{
      'updateOneDriver': instance.updateOneDriver.toJson(),
    };

UpdateDriverInput _$UpdateDriverInputFromJson(Map<String, dynamic> json) =>
    UpdateDriverInput(
      carProductionYear: json['carProductionYear'] as int?,
      carModelId: json['carModelId'] as String?,
      carColorId: json['carColorId'] as String?,
      searchDistance: json['searchDistance'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      status: $enumDecodeNullable(_$DriverStatusEnumMap, json['status'],
          unknownValue: DriverStatus.artemisUnknown),
      certificateNumber: json['certificateNumber'] as String?,
      email: json['email'] as String?,
      carPlate: json['carPlate'] as String?,
      mediaId: (json['mediaId'] as num?)?.toDouble(),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender'],
          unknownValue: Gender.artemisUnknown),
      accountNumber: json['accountNumber'] as String?,
      bankName: json['bankName'] as String?,
      bankRoutingNumber: json['bankRoutingNumber'] as String?,
      bankSwift: json['bankSwift'] as String?,
      address: json['address'] as String?,
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notificationPlayerId: json['notificationPlayerId'] as String?,
    );

Map<String, dynamic> _$UpdateDriverInputToJson(UpdateDriverInput instance) =>
    <String, dynamic>{
      'carProductionYear': instance.carProductionYear,
      'carModelId': instance.carModelId,
      'carColorId': instance.carColorId,
      'searchDistance': instance.searchDistance,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'status': _$DriverStatusEnumMap[instance.status],
      'certificateNumber': instance.certificateNumber,
      'email': instance.email,
      'carPlate': instance.carPlate,
      'mediaId': instance.mediaId,
      'gender': _$GenderEnumMap[instance.gender],
      'accountNumber': instance.accountNumber,
      'bankName': instance.bankName,
      'bankRoutingNumber': instance.bankRoutingNumber,
      'bankSwift': instance.bankSwift,
      'address': instance.address,
      'documents': instance.documents,
      'notificationPlayerId': instance.notificationPlayerId,
    };

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
  Gender.unknown: 'Unknown',
  Gender.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetDriver$Query$Driver$Media _$GetDriver$Query$Driver$MediaFromJson(
        Map<String, dynamic> json) =>
    GetDriver$Query$Driver$Media()
      ..id = json['id'] as String
      ..address = json['address'] as String;

Map<String, dynamic> _$GetDriver$Query$Driver$MediaToJson(
        GetDriver$Query$Driver$Media instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
    };

GetDriver$Query$Driver _$GetDriver$Query$DriverFromJson(
        Map<String, dynamic> json) =>
    GetDriver$Query$Driver()
      ..id = json['id'] as String
      ..status = $enumDecode(_$DriverStatusEnumMap, json['status'],
          unknownValue: DriverStatus.artemisUnknown)
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..gender = $enumDecodeNullable(_$GenderEnumMap, json['gender'],
          unknownValue: Gender.artemisUnknown)
      ..email = json['email'] as String?
      ..mobileNumber = json['mobileNumber'] as String
      ..accountNumber = json['accountNumber'] as String?
      ..bankName = json['bankName'] as String?
      ..bankRoutingNumber = json['bankRoutingNumber'] as String?
      ..address = json['address'] as String?
      ..documents = (json['documents'] as List<dynamic>)
          .map((e) =>
              GetDriver$Query$Driver$Media.fromJson(e as Map<String, dynamic>))
          .toList()
      ..bankSwift = json['bankSwift'] as String?
      ..media = json['media'] == null
          ? null
          : GetDriver$Query$Driver$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..carPlate = json['carPlate'] as String?
      ..carProductionYear = json['carProductionYear'] as int?
      ..certificateNumber = json['certificateNumber'] as String?
      ..carColorId = json['carColorId'] as String?
      ..carModelId = json['carModelId'] as String?;

Map<String, dynamic> _$GetDriver$Query$DriverToJson(
        GetDriver$Query$Driver instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$DriverStatusEnumMap[instance.status],
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': _$GenderEnumMap[instance.gender],
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'accountNumber': instance.accountNumber,
      'bankName': instance.bankName,
      'bankRoutingNumber': instance.bankRoutingNumber,
      'address': instance.address,
      'documents': instance.documents.map((e) => e.toJson()).toList(),
      'bankSwift': instance.bankSwift,
      'media': instance.media?.toJson(),
      'carPlate': instance.carPlate,
      'carProductionYear': instance.carProductionYear,
      'certificateNumber': instance.certificateNumber,
      'carColorId': instance.carColorId,
      'carModelId': instance.carModelId,
    };

GetDriver$Query$CarModel _$GetDriver$Query$CarModelFromJson(
        Map<String, dynamic> json) =>
    GetDriver$Query$CarModel()
      ..id = json['id'] as String
      ..name = json['name'] as String;

Map<String, dynamic> _$GetDriver$Query$CarModelToJson(
        GetDriver$Query$CarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GetDriver$Query$CarColor _$GetDriver$Query$CarColorFromJson(
        Map<String, dynamic> json) =>
    GetDriver$Query$CarColor()
      ..id = json['id'] as String
      ..name = json['name'] as String;

Map<String, dynamic> _$GetDriver$Query$CarColorToJson(
        GetDriver$Query$CarColor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GetDriver$Query _$GetDriver$QueryFromJson(Map<String, dynamic> json) =>
    GetDriver$Query()
      ..driver = json['driver'] == null
          ? null
          : GetDriver$Query$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..carModels = (json['carModels'] as List<dynamic>)
          .map((e) =>
              GetDriver$Query$CarModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..carColors = (json['carColors'] as List<dynamic>)
          .map((e) =>
              GetDriver$Query$CarColor.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetDriver$QueryToJson(GetDriver$Query instance) =>
    <String, dynamic>{
      'driver': instance.driver?.toJson(),
      'carModels': instance.carModels.map((e) => e.toJson()).toList(),
      'carColors': instance.carColors.map((e) => e.toJson()).toList(),
    };

Login$Mutation$Login _$Login$Mutation$LoginFromJson(
        Map<String, dynamic> json) =>
    Login$Mutation$Login()..jwtToken = json['jwtToken'] as String;

Map<String, dynamic> _$Login$Mutation$LoginToJson(
        Login$Mutation$Login instance) =>
    <String, dynamic>{
      'jwtToken': instance.jwtToken,
    };

Login$Mutation _$Login$MutationFromJson(Map<String, dynamic> json) =>
    Login$Mutation()
      ..login =
          Login$Mutation$Login.fromJson(json['login'] as Map<String, dynamic>);

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) =>
    <String, dynamic>{
      'login': instance.login.toJson(),
    };

SetDocumentsOnDriver$Mutation$Driver
    _$SetDocumentsOnDriver$Mutation$DriverFromJson(Map<String, dynamic> json) =>
        SetDocumentsOnDriver$Mutation$Driver()
          ..mobileNumber = json['mobileNumber'] as String
          ..firstName = json['firstName'] as String?
          ..lastName = json['lastName'] as String?
          ..searchDistance = json['searchDistance'] as int?
          ..media = json['media'] == null
              ? null
              : BasicProfileMixin$Media.fromJson(
                  json['media'] as Map<String, dynamic>)
          ..softRejectionNote = json['softRejectionNote'] as String?
          ..status = $enumDecode(_$DriverStatusEnumMap, json['status'],
              unknownValue: DriverStatus.artemisUnknown)
          ..currentOrders = (json['currentOrders'] as List<dynamic>)
              .map((e) =>
                  BasicProfileMixin$Order.fromJson(e as Map<String, dynamic>))
              .toList()
          ..wallets = (json['wallets'] as List<dynamic>)
              .map((e) => BasicProfileMixin$DriverWallet.fromJson(
                  e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$SetDocumentsOnDriver$Mutation$DriverToJson(
        SetDocumentsOnDriver$Mutation$Driver instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'searchDistance': instance.searchDistance,
      'media': instance.media?.toJson(),
      'softRejectionNote': instance.softRejectionNote,
      'status': _$DriverStatusEnumMap[instance.status],
      'currentOrders': instance.currentOrders.map((e) => e.toJson()).toList(),
      'wallets': instance.wallets.map((e) => e.toJson()).toList(),
    };

SetDocumentsOnDriver$Mutation _$SetDocumentsOnDriver$MutationFromJson(
        Map<String, dynamic> json) =>
    SetDocumentsOnDriver$Mutation()
      ..updateOneDriver = SetDocumentsOnDriver$Mutation$Driver.fromJson(
          json['updateOneDriver'] as Map<String, dynamic>)
      ..setDocumentsOnDriver = SetDocumentsOnDriver$Mutation$Driver.fromJson(
          json['setDocumentsOnDriver'] as Map<String, dynamic>);

Map<String, dynamic> _$SetDocumentsOnDriver$MutationToJson(
        SetDocumentsOnDriver$Mutation instance) =>
    <String, dynamic>{
      'updateOneDriver': instance.updateOneDriver.toJson(),
      'setDocumentsOnDriver': instance.setDocumentsOnDriver.toJson(),
    };

History$Query$OrderConnection _$History$Query$OrderConnectionFromJson(
        Map<String, dynamic> json) =>
    History$Query$OrderConnection()
      ..edges = (json['edges'] as List<dynamic>)
          .map((e) => HistoryOrderItemMixin$OrderEdge.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..pageInfo = HistoryOrderItemMixin$PageInfo.fromJson(
          json['pageInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$History$Query$OrderConnectionToJson(
        History$Query$OrderConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
      'pageInfo': instance.pageInfo.toJson(),
    };

History$Query _$History$QueryFromJson(Map<String, dynamic> json) =>
    History$Query()
      ..orders = History$Query$OrderConnection.fromJson(
          json['orders'] as Map<String, dynamic>);

Map<String, dynamic> _$History$QueryToJson(History$Query instance) =>
    <String, dynamic>{
      'orders': instance.orders.toJson(),
    };

GetOrderDetails$Query$Order$Point _$GetOrderDetails$Query$Order$PointFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetails$Query$Order$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetOrderDetails$Query$Order$PointToJson(
        GetOrderDetails$Query$Order$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetOrderDetails$Query$Order _$GetOrderDetails$Query$OrderFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetails$Query$Order()
      ..points = (json['points'] as List<dynamic>)
          .map((e) => GetOrderDetails$Query$Order$Point.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..finishTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['finishTimestamp'] as int?)
      ..distanceBest = json['distanceBest'] as int
      ..durationBest = json['durationBest'] as int
      ..paymentGatewayId = (json['paymentGatewayId'] as num?)?.toDouble()
      ..expectedTimestamp =
          fromGraphQLTimestampToDartDateTime(json['expectedTimestamp'] as int);

Map<String, dynamic> _$GetOrderDetails$Query$OrderToJson(
        GetOrderDetails$Query$Order instance) =>
    <String, dynamic>{
      'points': instance.points.map((e) => e.toJson()).toList(),
      'addresses': instance.addresses,
      'costBest': instance.costBest,
      'currency': instance.currency,
      'startTimestamp': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp),
      'finishTimestamp': fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.finishTimestamp),
      'distanceBest': instance.distanceBest,
      'durationBest': instance.durationBest,
      'paymentGatewayId': instance.paymentGatewayId,
      'expectedTimestamp':
          fromDartDateTimeToGraphQLTimestamp(instance.expectedTimestamp),
    };

GetOrderDetails$Query _$GetOrderDetails$QueryFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetails$Query()
      ..order = json['order'] == null
          ? null
          : GetOrderDetails$Query$Order.fromJson(
              json['order'] as Map<String, dynamic>);

Map<String, dynamic> _$GetOrderDetails$QueryToJson(
        GetOrderDetails$Query instance) =>
    <String, dynamic>{
      'order': instance.order?.toJson(),
    };

Wallet$Query$DriverWallet _$Wallet$Query$DriverWalletFromJson(
        Map<String, dynamic> json) =>
    Wallet$Query$DriverWallet()
      ..id = json['id'] as String
      ..balance = (json['balance'] as num).toDouble()
      ..currency = json['currency'] as String;

Map<String, dynamic> _$Wallet$Query$DriverWalletToJson(
        Wallet$Query$DriverWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'currency': instance.currency,
    };

Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacion
    _$Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacionFromJson(
            Map<String, dynamic> json) =>
        Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacion()
          ..createdAt =
              fromGraphQLTimestampToDartDateTime(json['createdAt'] as int)
          ..amount = (json['amount'] as num).toDouble()
          ..currency = json['currency'] as String
          ..refrenceNumber = json['refrenceNumber'] as String?
          ..deductType = $enumDecodeNullable(
              _$DriverDeductTransactionTypeEnumMap, json['deductType'],
              unknownValue: DriverDeductTransactionType.artemisUnknown)
          ..action = $enumDecode(_$TransactionActionEnumMap, json['action'],
              unknownValue: TransactionAction.artemisUnknown)
          ..rechargeType = $enumDecodeNullable(
              _$DriverRechargeTransactionTypeEnumMap, json['rechargeType'],
              unknownValue: DriverRechargeTransactionType.artemisUnknown);

Map<String, dynamic>
    _$Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacionToJson(
            Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacion
                instance) =>
        <String, dynamic>{
          'createdAt': fromDartDateTimeToGraphQLTimestamp(instance.createdAt),
          'amount': instance.amount,
          'currency': instance.currency,
          'refrenceNumber': instance.refrenceNumber,
          'deductType':
              _$DriverDeductTransactionTypeEnumMap[instance.deductType],
          'action': _$TransactionActionEnumMap[instance.action],
          'rechargeType':
              _$DriverRechargeTransactionTypeEnumMap[instance.rechargeType],
        };

const _$DriverDeductTransactionTypeEnumMap = {
  DriverDeductTransactionType.withdraw: 'Withdraw',
  DriverDeductTransactionType.commission: 'Commission',
  DriverDeductTransactionType.correction: 'Correction',
  DriverDeductTransactionType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$TransactionActionEnumMap = {
  TransactionAction.recharge: 'Recharge',
  TransactionAction.deduct: 'Deduct',
  TransactionAction.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$DriverRechargeTransactionTypeEnumMap = {
  DriverRechargeTransactionType.orderFee: 'OrderFee',
  DriverRechargeTransactionType.bankTransfer: 'BankTransfer',
  DriverRechargeTransactionType.inAppPayment: 'InAppPayment',
  DriverRechargeTransactionType.gift: 'Gift',
  DriverRechargeTransactionType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

Wallet$Query$DriverTransacionConnection$DriverTransacionEdge
    _$Wallet$Query$DriverTransacionConnection$DriverTransacionEdgeFromJson(
            Map<String, dynamic> json) =>
        Wallet$Query$DriverTransacionConnection$DriverTransacionEdge()
          ..node =
              Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacion
                  .fromJson(json['node'] as Map<String, dynamic>);

Map<String, dynamic>
    _$Wallet$Query$DriverTransacionConnection$DriverTransacionEdgeToJson(
            Wallet$Query$DriverTransacionConnection$DriverTransacionEdge
                instance) =>
        <String, dynamic>{
          'node': instance.node.toJson(),
        };

Wallet$Query$DriverTransacionConnection
    _$Wallet$Query$DriverTransacionConnectionFromJson(
            Map<String, dynamic> json) =>
        Wallet$Query$DriverTransacionConnection()
          ..edges = (json['edges'] as List<dynamic>)
              .map((e) =>
                  Wallet$Query$DriverTransacionConnection$DriverTransacionEdge
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$Wallet$Query$DriverTransacionConnectionToJson(
        Wallet$Query$DriverTransacionConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
    };

Wallet$Query _$Wallet$QueryFromJson(Map<String, dynamic> json) => Wallet$Query()
  ..driverWallets = (json['driverWallets'] as List<dynamic>)
      .map((e) => Wallet$Query$DriverWallet.fromJson(e as Map<String, dynamic>))
      .toList()
  ..driverTransacions = Wallet$Query$DriverTransacionConnection.fromJson(
      json['driverTransacions'] as Map<String, dynamic>);

Map<String, dynamic> _$Wallet$QueryToJson(Wallet$Query instance) =>
    <String, dynamic>{
      'driverWallets': instance.driverWallets.map((e) => e.toJson()).toList(),
      'driverTransacions': instance.driverTransacions.toJson(),
    };

PaymentGateways$Query$PaymentGateway$Media
    _$PaymentGateways$Query$PaymentGateway$MediaFromJson(
            Map<String, dynamic> json) =>
        PaymentGateways$Query$PaymentGateway$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$PaymentGateways$Query$PaymentGateway$MediaToJson(
        PaymentGateways$Query$PaymentGateway$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

PaymentGateways$Query$PaymentGateway
    _$PaymentGateways$Query$PaymentGatewayFromJson(Map<String, dynamic> json) =>
        PaymentGateways$Query$PaymentGateway()
          ..id = json['id'] as String
          ..title = json['title'] as String
          ..type = $enumDecode(_$PaymentGatewayTypeEnumMap, json['type'],
              unknownValue: PaymentGatewayType.artemisUnknown)
          ..publicKey = json['publicKey'] as String?
          ..media = json['media'] == null
              ? null
              : PaymentGateways$Query$PaymentGateway$Media.fromJson(
                  json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$PaymentGateways$Query$PaymentGatewayToJson(
        PaymentGateways$Query$PaymentGateway instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$PaymentGatewayTypeEnumMap[instance.type],
      'publicKey': instance.publicKey,
      'media': instance.media?.toJson(),
    };

const _$PaymentGatewayTypeEnumMap = {
  PaymentGatewayType.stripe: 'Stripe',
  PaymentGatewayType.brainTree: 'BrainTree',
  PaymentGatewayType.payPal: 'PayPal',
  PaymentGatewayType.paytm: 'Paytm',
  PaymentGatewayType.razorpay: 'Razorpay',
  PaymentGatewayType.paystack: 'Paystack',
  PaymentGatewayType.payU: 'PayU',
  PaymentGatewayType.instamojo: 'Instamojo',
  PaymentGatewayType.flutterwave: 'Flutterwave',
  PaymentGatewayType.payGate: 'PayGate',
  PaymentGatewayType.mips: 'MIPS',
  PaymentGatewayType.mercadoPago: 'MercadoPago',
  PaymentGatewayType.amazonPaymentServices: 'AmazonPaymentServices',
  PaymentGatewayType.myTMoney: 'MyTMoney',
  PaymentGatewayType.wayForPay: 'WayForPay',
  PaymentGatewayType.customLink: 'CustomLink',
  PaymentGatewayType.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

PaymentGateways$Query _$PaymentGateways$QueryFromJson(
        Map<String, dynamic> json) =>
    PaymentGateways$Query()
      ..paymentGateways = (json['paymentGateways'] as List<dynamic>)
          .map((e) => PaymentGateways$Query$PaymentGateway.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PaymentGateways$QueryToJson(
        PaymentGateways$Query instance) =>
    <String, dynamic>{
      'paymentGateways':
          instance.paymentGateways.map((e) => e.toJson()).toList(),
    };

TopUpWallet$Mutation$TopUpWalletResponse
    _$TopUpWallet$Mutation$TopUpWalletResponseFromJson(
            Map<String, dynamic> json) =>
        TopUpWallet$Mutation$TopUpWalletResponse()
          ..status = $enumDecode(_$TopUpWalletStatusEnumMap, json['status'],
              unknownValue: TopUpWalletStatus.artemisUnknown)
          ..url = json['url'] as String;

Map<String, dynamic> _$TopUpWallet$Mutation$TopUpWalletResponseToJson(
        TopUpWallet$Mutation$TopUpWalletResponse instance) =>
    <String, dynamic>{
      'status': _$TopUpWalletStatusEnumMap[instance.status],
      'url': instance.url,
    };

const _$TopUpWalletStatusEnumMap = {
  TopUpWalletStatus.ok: 'OK',
  TopUpWalletStatus.redirect: 'Redirect',
  TopUpWalletStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

TopUpWallet$Mutation _$TopUpWallet$MutationFromJson(
        Map<String, dynamic> json) =>
    TopUpWallet$Mutation()
      ..topUpWallet = TopUpWallet$Mutation$TopUpWalletResponse.fromJson(
          json['topUpWallet'] as Map<String, dynamic>);

Map<String, dynamic> _$TopUpWallet$MutationToJson(
        TopUpWallet$Mutation instance) =>
    <String, dynamic>{
      'topUpWallet': instance.topUpWallet.toJson(),
    };

TopUpWalletInput _$TopUpWalletInputFromJson(Map<String, dynamic> json) =>
    TopUpWalletInput(
      gatewayId: json['gatewayId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      token: json['token'] as String?,
      pin: (json['pin'] as num?)?.toDouble(),
      otp: (json['otp'] as num?)?.toDouble(),
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$TopUpWalletInputToJson(TopUpWalletInput instance) =>
    <String, dynamic>{
      'gatewayId': instance.gatewayId,
      'amount': instance.amount,
      'currency': instance.currency,
      'token': instance.token,
      'pin': instance.pin,
      'otp': instance.otp,
      'transactionId': instance.transactionId,
    };

SendMessageArguments _$SendMessageArgumentsFromJson(
        Map<String, dynamic> json) =>
    SendMessageArguments(
      requestId: json['requestId'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$SendMessageArgumentsToJson(
        SendMessageArguments instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'content': instance.content,
    };

GetStatsArguments _$GetStatsArgumentsFromJson(Map<String, dynamic> json) =>
    GetStatsArguments(
      startDate: fromGraphQLDateTimeToDartDateTime(json['startDate'] as int),
      endDate: fromGraphQLDateTimeToDartDateTime(json['endDate'] as int),
    );

Map<String, dynamic> _$GetStatsArgumentsToJson(GetStatsArguments instance) =>
    <String, dynamic>{
      'startDate': fromDartDateTimeToGraphQLDateTime(instance.startDate),
      'endDate': fromDartDateTimeToGraphQLDateTime(instance.endDate),
    };

MeArguments _$MeArgumentsFromJson(Map<String, dynamic> json) => MeArguments(
      versionCode: json['versionCode'] as int,
    );

Map<String, dynamic> _$MeArgumentsToJson(MeArguments instance) =>
    <String, dynamic>{
      'versionCode': instance.versionCode,
    };

UpdateDriverLocationArguments _$UpdateDriverLocationArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverLocationArguments(
      point: PointInput.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateDriverLocationArgumentsToJson(
        UpdateDriverLocationArguments instance) =>
    <String, dynamic>{
      'point': instance.point.toJson(),
    };

UpdateOrderStatusArguments _$UpdateOrderStatusArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateOrderStatusArguments(
      orderId: json['orderId'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown),
      cashPayment: (json['cashPayment'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UpdateOrderStatusArgumentsToJson(
        UpdateOrderStatusArguments instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'status': _$OrderStatusEnumMap[instance.status],
      'cashPayment': instance.cashPayment,
    };

UpdateDriverStatusArguments _$UpdateDriverStatusArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverStatusArguments(
      status: $enumDecode(_$DriverStatusEnumMap, json['status'],
          unknownValue: DriverStatus.artemisUnknown),
      fcmId: json['fcmId'] as String?,
    );

Map<String, dynamic> _$UpdateDriverStatusArgumentsToJson(
        UpdateDriverStatusArguments instance) =>
    <String, dynamic>{
      'status': _$DriverStatusEnumMap[instance.status],
      'fcmId': instance.fcmId,
    };

UpdateDriverSearchDistanceArguments
    _$UpdateDriverSearchDistanceArgumentsFromJson(Map<String, dynamic> json) =>
        UpdateDriverSearchDistanceArguments(
          distance: json['distance'] as int,
        );

Map<String, dynamic> _$UpdateDriverSearchDistanceArgumentsToJson(
        UpdateDriverSearchDistanceArguments instance) =>
    <String, dynamic>{
      'distance': instance.distance,
    };

UpdateProfileArguments _$UpdateProfileArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileArguments(
      input: UpdateDriverInput.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateProfileArgumentsToJson(
        UpdateProfileArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
    };

LoginArguments _$LoginArgumentsFromJson(Map<String, dynamic> json) =>
    LoginArguments(
      firebaseToken: json['firebaseToken'] as String,
    );

Map<String, dynamic> _$LoginArgumentsToJson(LoginArguments instance) =>
    <String, dynamic>{
      'firebaseToken': instance.firebaseToken,
    };

SetDocumentsOnDriverArguments _$SetDocumentsOnDriverArgumentsFromJson(
        Map<String, dynamic> json) =>
    SetDocumentsOnDriverArguments(
      driverId: json['driverId'] as String,
      relationIds: (json['relationIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SetDocumentsOnDriverArgumentsToJson(
        SetDocumentsOnDriverArguments instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'relationIds': instance.relationIds,
    };

GetOrderDetailsArguments _$GetOrderDetailsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetailsArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetOrderDetailsArgumentsToJson(
        GetOrderDetailsArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

TopUpWalletArguments _$TopUpWalletArgumentsFromJson(
        Map<String, dynamic> json) =>
    TopUpWalletArguments(
      input: TopUpWalletInput.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopUpWalletArgumentsToJson(
        TopUpWalletArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
    };

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../graphql/generated/graphql_api.dart';
import '../../main_bloc.dart';

Future<void> updateCurrentOrderStatus(
  MainBloc bloc,
  RunMutation runMutation,
  OrderStatus orderStatus,
  CurrentOrderMixin order, {
  double? cashPayment,
}) async {
  final result = await runMutation(UpdateOrderStatusArguments(
    orderId: order.id,
    status: orderStatus,
    cashPayment: cashPayment ?? 0,
  ).toJson())
      .networkResult;

  bloc.add(CurrentOrderUpdated(result!.data!['updateOneOrder']));
}

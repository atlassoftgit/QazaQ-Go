import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../data/global_variables.dart';
import '../../generated/l10n.dart';
import '../../graphql/generated/graphql_api.dart';
import '../../main_bloc.dart';
import '../service/order_functions.dart';

class OrderUpdateButton extends StatelessWidget {
  const OrderUpdateButton({
    required this.result,
    required this.order,
    required this.runMutation,
    this.onSuccess,
    Key? key,
  }) : super(key: key);

  final QueryResult? result;
  final CurrentOrderMixin order;
  final RunMutation runMutation;
  final VoidCallback? onSuccess;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bloc = context.read<MainBloc>();
    VoidCallback? onPressed;
    String? text;

    switch (order.status) {
      case OrderStatus.driverAccepted:
        onPressed = () {
          updateCurrentOrderStatus(bloc, runMutation, OrderStatus.arrived, order);
          navigationService.reachHomePoint();
        };
        text = S.of(context).order_status_action_arrived;
        break;
      case OrderStatus.arrived:
        onPressed = () {
          updateCurrentOrderStatus(bloc, runMutation, OrderStatus.started, order);
        };

        text = S.of(context).order_status_action_start;
        break;
      case OrderStatus.started:
        onPressed = () {
          updateCurrentOrderStatus(bloc, runMutation, OrderStatus.finished, order);
        };
        text = S.of(context).order_status_action_finished;

        break;
      case OrderStatus.finished:
      case OrderStatus.waitingForPostPay:
        onPressed = () {
          updateCurrentOrderStatus(
            bloc,
            runMutation,
            OrderStatus.finished,
            order,
            cashPayment: (order.costAfterCoupon - order.paidAmount),
          );
        };
        text = S.of(context).order_status_action_received_cash;
        break;
      default:
        break;
    }

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: (result?.isLoading ?? false)
            ? null
            : () {
                onPressed?.call();
                onSuccess?.call();
              },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        child: (result?.isLoading ?? false) && text != null
            ? const CircularProgressIndicator.adaptive()
            : Text(
                text ?? '...',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: colorScheme.secondaryContainer,
                    ),
              ),
      ),
    );
  }
}

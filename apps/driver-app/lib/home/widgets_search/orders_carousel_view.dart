import 'package:client_shared/theme/font.dart';

import '../../main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../graphql/generated/graphql_api.dart';
import '../../widgets/query_result_view.dart';
import 'order_item_view.dart';

class OrdersCarouselView extends StatelessWidget {
  final PageController carouselController = PageController();

  OrdersCarouselView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    final colorScheme = Theme.of(context).colorScheme;

    return Query(
      options:
          QueryOptions(document: AVAILABLE_ORDERS_QUERY_DOCUMENT, fetchPolicy: FetchPolicy.noCache),
      builder: (QueryResult result,
          {Future<QueryResult?> Function()? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return QueryResultView(result);
        }

        if (result.isLoading) {
          return const SizedBox();
        }

        if (mainBloc.state is StatusOnline &&
            (mainBloc.state as StatusOnline).orders.length !=
                result.data!['availableOrders'].length) {
          mainBloc.add(AvailableOrdersUpdated(result.data!['availableOrders']));
        }

        return Subscription(
          options: SubscriptionOptions(
              document: ORDER_CREATED_SUBSCRIPTION_DOCUMENT, fetchPolicy: FetchPolicy.noCache),
          builder: (QueryResult? created) {
            if (created?.data != null) {
              mainBloc.add(AvailableOrderAdded(created!.data!));
            }
            return Subscription(
              options: SubscriptionOptions(document: ORDER_REMOVED_SUBSCRIPTION_DOCUMENT),
              builder: (QueryResult? updated) {
                if (updated?.data != null) {
                  mainBloc.add(AvailableOrderRemoved(updated!.data!));
                }
                return Mutation(
                  options: MutationOptions(
                    document: UPDATE_ORDER_STATUS_MUTATION_DOCUMENT,
                  ),
                  builder: (
                    RunMutation runMutation,
                    QueryResult? result,
                  ) =>
                      BlocBuilder<MainBloc, MainState>(
                    builder: (context, state) {
                      if ((state as StatusOnline).orders.isEmpty) {
                        return const SizedBox();
                      }
                      return SizedBox(
                        height: 325,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.9),
                          itemCount: state.orders.length,
                          onPageChanged: (index) => mainBloc.add(SelectedOrderChanged(index)),
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: OrderItemView(
                              order: state.orders[index],
                              isActionActive: ((result?.isLoading ?? false) == false),
                              onAcceptCallback: (String orderId) async {
                                final result = await runMutation(UpdateOrderStatusArguments(
                                  orderId: orderId,
                                  status: OrderStatus.driverAccepted,
                                ).toJson())
                                    .networkResult;

                                if (result?.hasException ?? true) {
                                  print("hasException  ${result?.exception?.graphqlErrors.map((e) => e.message)}");
                                  final snackBar = SnackBar(
                                    backgroundColor: colorScheme.onPrimary,
                                    content: Text(
                                      'У вас недостаточно средств, пожалуйста, пополните счет!',
                                      style: MyFont.style(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  return;
                                }
                                mainBloc.add(
                                  CurrentOrderUpdated(
                                    result!.data!['updateOneOrder'],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

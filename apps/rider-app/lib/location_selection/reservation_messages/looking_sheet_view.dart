import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../generated/l10n.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import '../../main/bloc/main_bloc.dart';

class LookingSheetView extends StatelessWidget {
  const LookingSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: SafeArea(
        minimum: const EdgeInsets.all(16),
        top: false,
        child: Column(
          children: [
            Text(
              S.of(context).body_ride_requested,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const LinearProgressIndicator().pSymmetric(v: 8),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                    child: Text(
                  S.of(context).body_ride_requested,
                  style: Theme.of(context).textTheme.bodyMedium,
                ).pOnly(right: 16)),
                Flexible(
                    child: Image.asset(
                  "images/searching.png",
                ).pSymmetric(v: 8))
              ],
            ),
            Row(
              children: [
                Subscription(
                  options: SubscriptionOptions(
                      document: UPDATED_ORDER_SUBSCRIPTION_DOCUMENT,
                      fetchPolicy: FetchPolicy.noCache),
                  builder: (QueryResult result) {
                    if (result.data != null) {
                      final order = GetCurrentOrder$Query$Rider$Order.fromJson(
                          result.data!['orderUpdated']);
                      mainBloc.add(CurrentOrderUpdated(order));
                    }
                    return Mutation(
                        options: MutationOptions(
                            document: CANCEL_ORDER_MUTATION_DOCUMENT),
                        builder:
                            (RunMutation runMutation, QueryResult? result) {
                          return Expanded(
                            child: OutlinedButton(
                                onPressed: () async {
                                  final net =
                                      await runMutation({}).networkResult;
                                  final order =
                                      CancelOrder$Mutation.fromJson(net!.data!)
                                          .cancelOrder;
                                  mainBloc.add(CurrentOrderUpdated(order));
                                },
                                child: Text(
                                  S.of(context).action_cancel_request,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                          );
                        });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

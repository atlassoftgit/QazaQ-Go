import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/components/empty_state_card_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../generated/l10n.dart';
import '../widgets/query_result_view.dart';
import 'trip_history_details_view.dart';
import 'trip_history_item_view.dart';

import '../data/images.dart';
import '../graphql/generated/graphql_api.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TripHistoryListView extends StatefulWidget {
  const TripHistoryListView({Key? key}) : super(key: key);

  @override
  _TripHistoryListViewState createState() => _TripHistoryListViewState();
}

class _TripHistoryListViewState extends State<TripHistoryListView> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RidyBackButton(titleRidyBackButton: S.of(context).back),
            const SizedBox(height: 16),
            Query(
              options: QueryOptions(
                  document: HISTORY_QUERY_DOCUMENT,
                  fetchPolicy: FetchPolicy.noCache),
              builder: (QueryResult result,
                  {Refetch? refetch, FetchMore? fetchMore}) {
                if (result.hasException || result.isLoading) {
                  return QueryResultView(result);
                }
                final query = History$Query.fromJson(result.data!);
                final orders = query.orders.edges;
                if (orders.isEmpty) {
                  return EmptyStateCard(
                    title: S.of(context).no_necords,
                    description: S.of(context).trip_history_empty_state,
                    icon: Ionicons.cloud_offline,
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final item = orders[index].node;
                      return TripHistoryItemView(
                        id: item.id,
                        title: item.service.name,
                        dateTime: item.createdOn,
                        currency: item.currency,
                        price: item.costAfterCoupon,
                        titleCanceled: S.of(context).canceled,
                        isCanceled: item.status == OrderStatus.riderCanceled ||
                            item.status == OrderStatus.driverCanceled,
                        onPressed: (id) {
                          showBarModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return TripHistoryDetailsView(
                                orderId: id,
                              );
                            },
                          );
                        },
                        image: Images.iconCar,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      height: 1,
                      color: colorScheme.onBackground,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

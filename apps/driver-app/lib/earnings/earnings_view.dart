import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/components/empty_state_card_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../generated/l10n.dart';
import '../graphql/generated/graphql_api.dart';
import 'package:intl/intl.dart';

import '../data/images.dart';
import '../trip-history/trip_history_item_view.dart';

class EarningsView extends StatefulWidget {
  const EarningsView({Key? key}) : super(key: key);

  @override
  State<EarningsView> createState() => _EarningsViewState();
}

class _EarningsViewState extends State<EarningsView> {
  final daysOfWeek = <String, String>{
    'Monday': 'Пн.',
    'Tuesday': 'Вт.',
    'Wednesday': 'Ср.',
    'Thursday': 'Чт.',
    'Friday': 'Пт.',
    'Saturday': 'Сб.',
    'Sunday': 'Вс.',
  };

  DateTime startDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RidyBackButton(titleRidyBackButton: S.of(context).back),
            Query(
              options: QueryOptions(
                  document: GET_STATS_QUERY_DOCUMENT,
                  variables:
                      GetStatsArguments(startDate: startDate, endDate: endDate)
                          .toJson()),
              builder: (QueryResult result,
                  {Future<QueryResult?> Function()? refetch,
                  FetchMore? fetchMore}) {
                if (result.isLoading) {
                  return const CircularProgressIndicator.adaptive();
                }
                if (result.hasException) {
                  return Center(
                      child: Text(
                          result.exception?.graphqlErrors.first.message ?? ""));
                }
                final stats = GetStats$Query.fromJson(result.data!);
                var index = 0;
                var total = 0.0;
                final List<BarChartGroupData> barData =
                    stats.getStatsNew.dataset
                        .map<BarChartGroupData>(
                          (data) {
                            total += data.earning;

                            return BarChartGroupData(
                            x: index++,
                            barRods: [
                              BarChartRodData(
                                borderRadius: BorderRadius.circular(10),
                                width: 200 / stats.getStatsNew.dataset.length,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    CustomTheme.primaryColors,
                                    CustomTheme.primaryColors.shade700,
                                  ],
                                ),
                                toY: data.earning,
                              ),
                            ],
                          );
                          },
                        )
                        .toList();
                if (stats.getStatsNew.dataset.isEmpty) {
                  return EmptyStateCard(
                    title: S.of(context).no_data_found,
                    description: S
                        .of(context)
                        .at_the_criteria_set_above_we_cant_find_any_records,
                    icon: Ionicons.cloud_offline,
                  );
                }
                return Expanded(
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                                child: const Icon(Ionicons.caret_back,
                                    color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    endDate = startDate
                                        .subtract(const Duration(days: 1));
                                    startDate = endDate
                                        .subtract(const Duration(days: 7));
                                  });
                                }),
                            Column(
                              children: [
                                Text(
                                  "${DateFormat('MMMd').format(startDate)}-${DateFormat('MMMd').format(endDate)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: colorScheme.onSecondaryContainer,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${stats.getStatsNew.currency} ${total.round()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color: colorScheme.onSecondaryContainer,
                                      ),
                                )
                              ],
                            ),
                            CupertinoButton(
                                onPressed:
                                    endDate.difference(DateTime.now()).inDays >
                                            -1
                                        ? null
                                        : () {
                                            setState(() {
                                              startDate = endDate
                                                  .add(const Duration(days: 1));
                                              endDate = startDate
                                                  .add(const Duration(days: 7));
                                            });
                                          },
                                child: const Icon(Ionicons.caret_forward,
                                    color: Colors.black))
                          ]),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 300,
                        child: BarChart(
                          BarChartData(
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.grey.shade800,
                                getTooltipItem:
                                    (group, groupIndex, rod, rodIndex) =>
                                        BarTooltipItem(
                                  NumberFormat.simpleCurrency(
                                    name: stats.getStatsNew.currency,
                                  ).format(
                                    stats.getStatsNew.dataset[groupIndex]
                                        .earning,
                                  ),
                                  const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            barGroups: barData,
                            groupsSpace: 0,
                            gridData: FlGridData(show: false),
                            borderData: FlBorderData(show: false),
                            titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                  reservedSize: 40,
                                  showTitles: true,
                                  getTitlesWidget: (index, title) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        daysOfWeek[stats.getStatsNew
                                                .dataset[index.toInt()].name] ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              color: colorScheme
                                                  .onSecondaryContainer,
                                            ),
                                      ),
                                    );
                                  },
                                ))),
                          ),
                          swapAnimationDuration:
                              const Duration(milliseconds: 250),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: stats.orders.edges.length,
                          itemBuilder: ((context, index) {
                            final item = stats.orders.edges[index].node;
                            return TripHistoryItemView(
                              id: item.id,
                              title: item.service.name,
                              dateTime: item.createdOn,
                              currency: item.currency,
                              price: item.costAfterCoupon,
                              titleCanceled: S.of(context).canceled,
                              isCanceled:
                                  item.status == OrderStatus.riderCanceled ||
                                      item.status == OrderStatus.driverCanceled,
                              onPressed: (id) {},
                              image: Images.iconCar,
                            );
                          }),
                        ),
                      ),
                    ],
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

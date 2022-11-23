import 'package:client_shared/components/ridy_sheet_view.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../config.dart';
import '../../widgets/current_location_cubit.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../data/images.dart';
import '../../generated/l10n.dart';
import '../../graphql/generated/graphql_api.dart';
import 'package:intl/intl.dart';

class OrderItemView extends StatelessWidget {
  final AvailableOrderMixin order;
  final OrderAcceptedCallback onAcceptCallback;
  final bool isActionActive;

  const OrderItemView(
      {Key? key, required this.order, required this.onAcceptCallback, required this.isActionActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<CurrentLocationCubit, CurrentLocationState>(builder: (context, state) {
      final driverDistanceMeters = order.distanceBest;
      return RidySheetView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UserAvatarView(
                      urlPrefix: serverUrl,
                      url: null,
                      cornerRadius: 60,
                      size: 50,
                      image: Images.iconUser,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.service.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: colorScheme.onSecondaryContainer),
                        ),
                        Text(
                          "${(driverDistanceMeters / 1000).toStringAsFixed(2)} KM",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: colorScheme.onSecondaryContainer),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: CustomTheme.primaryColors.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    NumberFormat.simpleCurrency(name: order.currency, decimalDigits: 2)
                        .format(order.costBest),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: colorScheme.onSecondaryContainer),
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Color(0xffD8DEE4)),
            ...order.addresses.mapIndexed((e, index) {
              if (order.addresses.length > 2 && index > 0 && index != order.addresses.length - 1) {
                return const SizedBox(
                  width: 1,
                  height: 1,
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(
                            getIconByIndex(index, order.addresses.length),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          e,
                          overflow: e.length > 80 ? TextOverflow.ellipsis : null,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: colorScheme.onSecondaryContainer),
                        ),
                      ),
                    ],
                  ).pOnly(right: 4),
                  if (index < order.addresses.length - 1)
                    DottedLine(
                      direction: Axis.vertical,
                      lineLength: 20,
                      lineThickness: 3,
                      dashLength: 3,
                      dashColor: CustomTheme.neutralColors.shade500,
                    ).pOnly(left: 16)
                ],
              );
            }).toList(),
            const Spacer(),
            Row(
                children: order.options
                    .map(
                      (e) => OrderPreferenceTagView(
                        icon: e.icon,
                        name: e.name,
                      ),
                    )
                    .toList()),
            const Divider(color: Color(0xffD8DEE4)),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(23),
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                onPressed: isActionActive ? () => onAcceptCallback(order.id) : null,
                child: isActionActive
                    ? Row(
                        children: [
                          const Spacer(),
                          Text(
                            S.of(context).available_order_action_accept,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: colorScheme.secondaryContainer,
                                ),
                          ),
                          const Spacer()
                        ],
                      ).p4()
                    : const CircularProgressIndicator.adaptive(),
              ),
            ).p4()
          ],
        ),
      );
    });
  }

  getIconByIndex(int index, int length) {
    if (index == 0) {
      return Images.iconStartPoint;
    } else if (index == length - 1) {
      return Images.iconEndPoint;
    } else {}
    return Images.iconEndPoint;
  }
}

typedef OrderAcceptedCallback = void Function(String orderId);

String durationToString(Duration duration, BuildContext context) =>
    ("${duration.inMinutes.toStringAsFixed(0)} ${S.of(context).time_min}");

class OrderPreferenceTagView extends StatelessWidget {
  final ServiceOptionIcon icon;
  final String name;

  const OrderPreferenceTagView({required this.icon, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: CustomTheme.neutralColors.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: CustomTheme.primaryColors, borderRadius: BorderRadius.circular(16)),
            child: Icon(
              getOptionIcon(),
              size: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            name,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }

  IconData getOptionIcon() {
    switch (icon) {
      case ServiceOptionIcon.pet:
        return Ionicons.paw;

      case ServiceOptionIcon.twoWay:
        return Ionicons.repeat;

      case ServiceOptionIcon.luggage:
        return Ionicons.briefcase;

      case ServiceOptionIcon.packageDelivery:
        return Ionicons.cube;

      case ServiceOptionIcon.shopping:
        return Ionicons.cart;

      case ServiceOptionIcon.custom1:
        return Ionicons.help;

      case ServiceOptionIcon.custom2:
        return Ionicons.help;

      case ServiceOptionIcon.custom3:
        return Ionicons.help;

      case ServiceOptionIcon.custom4:
        return Ionicons.help;

      case ServiceOptionIcon.custom5:
        return Ionicons.help;

      case ServiceOptionIcon.artemisUnknown:
        return Ionicons.help;
    }
  }
}

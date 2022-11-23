import 'package:client_shared/components/light_colored_button.dart';
import 'package:client_shared/components/ridy_sheet_view.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../widgets/ride_options_sheet_view.dart';
import '../../widgets/rider_preferences_sheet_view.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../../config.dart';
import '../../data/images.dart';
import '../../generated/l10n.dart';
import '../../main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../graphql/generated/graphql_api.dart';

import '../service/order_functions.dart';
import 'navigation_button.dart';
import 'order_invoice_view.dart';
import 'order_update_button.dart';

class OrderStatusCardView extends StatefulWidget {
  final CurrentOrderMixin order;

  const OrderStatusCardView({required this.order, Key? key}) : super(key: key);

  @override
  State<OrderStatusCardView> createState() => _OrderStatusCardViewState();
}

class _OrderStatusCardViewState extends State<OrderStatusCardView> {
  @override
  initState() {
    super.initState();

    timeago.setLocaleMessages('ru', timeago.RuMessages());
  }

  String _getTitleForStatus(OrderStatus status, BuildContext context) {
    switch (status) {
      case OrderStatus.driverAccepted:
        return S.of(context).rider_will_be_notified_once_you_tap_arrived;

      case OrderStatus.arrived:
        return S.of(context).rider_has_been_notified;

      case OrderStatus.started:
        return S.of(context).heading_to_destination;

      default:
        return "";
    }
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    final canLaunch = await canLaunchUrl(Uri.parse(url));

    if (!canLaunch) {
      final snackBar = SnackBar(
        content: Text(
          S.of(context).message_cant_open_url,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    final colorScheme = Theme.of(context).colorScheme;

    return Mutation(
      options: MutationOptions(document: UPDATE_ORDER_STATUS_MUTATION_DOCUMENT),
      builder: (RunMutation runMutation, QueryResult? result) {
        if (widget.order.status == OrderStatus.waitingForPostPay) {
          return OrderInvoiceView(
            order: widget.order,
            result: result,
            button: OrderUpdateButton(
              result: result,
              order: widget.order,
              runMutation: runMutation,
            ),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavigationButton(order: widget.order),
            RidySheetView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SheetTitleView(title: _getTitleForStatus(widget.order.status, context)),
                  Row(
                    children: [
                      UserAvatarView(
                        urlPrefix: serverUrl,
                        url: widget.order.rider.media?.address,
                        cornerRadius: 40,
                        size: 50,
                        image: Images.iconUser,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.order.rider.firstName ?? "-"} ${widget.order.rider.lastName ?? "-"}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: colorScheme.onSecondaryContainer),
                            ),
                            const SizedBox(height: 5),
                            if (widget.order.status == OrderStatus.driverAccepted)
                              timeago.Timeago(
                                locale: 'ru',
                                builder: (context, text) {
                                  return Text(
                                    "${S.of(context).rider} ${(widget.order.etaPickup?.isBefore(DateTime.now()) ?? false) ? S.of(context).expected_you : S.of(context).expects_you_in} $text",
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          color: colorScheme.onTertiaryContainer,
                                        ),
                                  );
                                },
                                date: widget.order.etaPickup ?? DateTime.now(),
                              ),
                            if (widget.order.status == OrderStatus.started ||
                                widget.order.status == OrderStatus.arrived)
                              Row(
                                children: [
                                  Icon(
                                    widget.order.paidAmount < widget.order.costAfterCoupon
                                        ? Ionicons.close_circle
                                        : Ionicons.checkmark_circle,
                                    size: 14,
                                    color: widget.order.paidAmount < widget.order.costAfterCoupon
                                        ? const Color(0xffb20d0e)
                                        : const Color(0xff108910),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.45,
                                    child: Text(
                                      widget.order.paidAmount < widget.order.costAfterCoupon
                                          ? S.of(context).ride_hasnt_been_paid_yet
                                          : S.of(context).rider_has_been_paid,
                                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                            color: widget.order.paidAmount <
                                                    widget.order.costAfterCoupon
                                                ? const Color(0xffD82A49)
                                                : const Color(0xff108910),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ).pOnly(left: 8),
                      ),
                      if (widget.order.status == OrderStatus.driverAccepted ||
                          widget.order.status == OrderStatus.arrived)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: IconButton(
                            icon: Image.asset(Images.iconPhone),
                            onPressed: () {
                              _launchUrl(context, "tel://${widget.order.rider.mobileNumber}");
                            },
                          ),
                        ),
                      const SizedBox(width: 8),
                      if (widget.order.status == OrderStatus.driverAccepted ||
                          widget.order.status == OrderStatus.arrived)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: IconButton(
                            icon: Image.asset(Images.iconSms),
                            onPressed: () {
                              Navigator.pushNamed(context, 'chat');
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (widget.order.status == OrderStatus.driverAccepted ||
                      widget.order.options.isNotEmpty)
                    const Divider(),
                  if (widget.order.status == OrderStatus.driverAccepted)
                    Row(
                      children: [
                        LightColoredButton(
                          colorOption: colorScheme.onSecondaryContainer,
                          icon: Ionicons.list,
                          text: S.of(context).ride_options,
                          onPressed: () async {
                            final result = await showModalBottomSheet<RideOptionsResult>(
                                context: context,
                                builder: (context) {
                                  return const RideOptionsSheetView();
                                });
                            switch (result) {
                              case RideOptionsResult.cancel:
                                updateCurrentOrderStatus(
                                  bloc,
                                  runMutation,
                                  OrderStatus.driverCanceled,
                                  widget.order,
                                );
                                break;
                              case RideOptionsResult.none:
                              case null:
                                break;
                            }
                          },
                        ),
                        const Spacer(),
                        if (widget.order.options.isNotEmpty)
                          LightColoredButton(
                            icon: Ionicons.options,
                            text: S.of(context).rider_preferences,
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return RiderPreferencesSheetView(
                                    options: widget.order.options,
                                  );
                                },
                              );
                            },
                          ),
                      ],
                    ),
                  const SizedBox(height: 12),
                  OrderUpdateButton(
                    result: result,
                    order: widget.order,
                    runMutation: runMutation,
                  ),
                ],
              ).px4(),
            ),
          ],
        );
      },
    );
  }
}

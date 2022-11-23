import 'package:client_shared/components/light_colored_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:client_shared/components/ridy_sheet_view.dart';
import 'package:ridy/data/images.dart';
import 'package:ridy/generated/l10n.dart';
import 'package:ridy/main/enter_coupon_code_sheet_view.dart';
import 'package:ridy/main/reserve_ride_sheet_view.dart';
import 'package:ridy/main/ride_preferences_sheet_view.dart';
import 'package:client_shared/theme/theme.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import '../main/service_item_view.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bloc/main_bloc.dart';

class SelectServiceView extends StatefulWidget {
  const SelectServiceView({Key? key, required this.data, required this.onServiceSelect}) : super(key: key);
  final GetFare$Query$CalculateFareDTO data;
  final ServiceSelectCallback onServiceSelect;

  @override
  State<SelectServiceView> createState() => _SelectServiceViewState();
}

class _SelectServiceViewState extends State<SelectServiceView> {
  @override
  Widget build(BuildContext context) {
    final mainBloc = (context.read<MainBloc>().state) as OrderPreview;
    return RidySheetView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          OrderPreviewServices(
            serviceCategories: widget.data.services,
            currency: widget.data.currency,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            Expanded(
                child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: mainBloc.selectedService == null
                    ? null
                    : () async {
                        widget.onServiceSelect(mainBloc.selectedService.toString(), 0);
                      },
                child: Text(
                  S.of(context).service_selection_book_now,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            )),
            const SizedBox(width: 15),
            InkWell(
              onTap: mainBloc.selectedService == null
                  ? null
                  : () async {
                      final dialogResult = await showModalBottomSheet<DateTime>(
                        context: context,
                        builder: (context) => const ReserveRideSheetView(),
                      );

                      if (dialogResult == null) {
                        return;
                      }

                      final difference = dialogResult.difference(DateTime.now()).inMinutes;
                      widget.onServiceSelect(mainBloc.selectedService!.id, difference);
                    },
              child: Image.asset(
                Images.iconCalendar,
                height: 50,
                fit: BoxFit.fitHeight,
              ),
            ),
          ])
        ],
      ),
    );
  }
}

class OrderPreviewServices extends StatelessWidget {
  final List<GetFare$Query$CalculateFareDTO$ServiceCategory> serviceCategories;
  final String currency;

  const OrderPreviewServices({required this.serviceCategories, required this.currency, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return DefaultTabController(
      length: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TabBar(
            isScrollable: true,
            indicator: BoxDecoration(
              color: CustomTheme.primaryColors.shade300,
              borderRadius: BorderRadius.circular(24),
            ),
            unselectedLabelColor: CustomTheme.neutralColors,
            labelColor: CustomTheme.primaryColors.shade900,
            unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
            labelStyle: Theme.of(context).textTheme.titleSmall,
            tabs: [
              Tab(
                height: 28,
                text: serviceCategories.first.name,
              )
            ],
          ),
          const Divider(),
          SizedBox(
            height: 185,
            child: TabBarView(
              children: [
                ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  children: serviceCategories.first.services
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: ServiceItemView(
                            currency: currency,
                            service: e,
                            isSelected: e.id == (mainBloc.state as OrderPreview).selectedService?.id,
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
          const Divider(),
          Row(
            children: [
              BlocBuilder<MainBloc, MainBlocState>(
                builder: (context, state) {
                  if (state is! OrderPreview ||
                      state.selectedService == null ||
                      state.selectedService!.options.isEmpty) {
                    return const SizedBox();
                  }
                  return LightColoredButton(
                    icon: Ionicons.options,
                    text: S.of(context).references_title,
                    onPressed: () async {
                      final dialogResult = await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          constraints: const BoxConstraints(maxWidth: 500),
                          builder: (context) {
                            return RidePreferencesSheetView(
                              state.selectedService!,
                              state.selectedOptions,
                            );
                          });
                      if (dialogResult != null) {
                        final points = state.points;
                        mainBloc.add(
                          ShowPreview(
                            points: points,
                            selectedOptions: dialogResult,
                            couponCode: state.couponCode,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              const Spacer(),
              LightColoredButton(
                text: S.of(context).coupon_textfield_hint,
                colorText: Colors.black,
                iconString: Images.iconPercent,
                onPressed: () async {
                  final bloc = context.read<MainBloc>();
                  (bloc.state as OrderPreview);
                  final code = await showModalBottomSheet<String>(
                      context: context,
                      isScrollControlled: true,
                      constraints: const BoxConstraints(maxWidth: 500),
                      builder: (context) {
                        return const EnterCouponCodeSheetView();
                      });
                  if (code.isEmptyOrNull) return;

                  bloc.add(
                    ShowPreview(
                      points: (bloc.state as OrderPreview).points,
                      selectedOptions: (bloc.state as OrderPreview).selectedOptions,
                      couponCode: code,
                    ),
                  );
                },
              )
            ],
          ).pSymmetric(v: 4)
        ],
      ),
    );
  }
}

typedef ServiceSelectCallback = void Function(String serviceId, int intervalMinutes);

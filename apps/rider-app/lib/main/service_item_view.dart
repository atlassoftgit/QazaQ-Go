import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import 'package:intl/intl.dart';

import 'package:client_shared/theme/theme.dart';

import 'bloc/main_bloc.dart';

class ServiceItemView extends StatelessWidget {
  final bool isSelected;
  final GetFare$Query$CalculateFareDTO$ServiceCategory$Service service;
  final String currency;

  const ServiceItemView(
      {Key? key,
      required this.isSelected,
      required this.service,
      required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return GestureDetector(
      onTap: () => mainBloc.add(SelectService(service)),
      child: AnimatedContainer(
        width: 150,
        height: 100,
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            color: isSelected
                ? CustomTheme.primaryColors.shade100
                : CustomTheme.primaryColors.shade50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 20),
            Image.network(
              serverUrl + service.media.address,
            ),
            Text(
              service.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    NumberFormat.currency(name: currency, decimalDigits: 0)
                        .format(service.cost),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                        ),
                  ),
                  if (service.costAfterCoupon != null &&
                      service.cost != service.costAfterCoupon)
                    Text(
                      NumberFormat.simpleCurrency(name: currency)
                          .format(service.costAfterCoupon),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: const Color(0xff108910)),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

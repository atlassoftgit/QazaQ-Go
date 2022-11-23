import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

import '../theme/theme.dart';

class WalletCardView extends StatelessWidget {
  final String currency;
  final double credit;
  final Function() onAdddCredit;
  final Function()? onRedeemGiftCard;
  final String titleRidyWallet, titleAddCredit, titleRedeemGiftCard;

  const WalletCardView(
      {required this.currency,
      required this.titleRidyWallet,
      required this.titleAddCredit,
      required this.titleRedeemGiftCard,
      required this.credit,
      required this.onAdddCredit,
      this.onRedeemGiftCard,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff464F8B)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titleRidyWallet,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: CustomTheme.primaryColors.shade50),
              ),
              const SizedBox(width: 5),
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.titleLarge,
                    children: [
                      TextSpan(
                        text: ' Q',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: Colors.red),
                      ),
                    ]),
              ),
              CircleAvatar(
                backgroundColor: CustomTheme.neutralColors.shade100,
                child: Center(
                    child: Text('GO',
                        style: Theme.of(context).textTheme.headlineLarge)),
              ),
              const Spacer(),
              Image.asset('images/three_dots.png', height: 45)
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: CustomTheme.primaryColors.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                    NumberFormat.simpleCurrency(name: currency).currencySymbol,
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              const SizedBox(width: 8),
              Text(
                NumberFormat.simpleCurrency(name: currency, decimalDigits: 0).format(credit),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: CustomTheme.primaryColors.shade100),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(
                          Icons.add_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        titleAddCredit,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: CustomTheme.primaryColors.shade200),
                      )
                    ],
                  ),
                  onPressed: () => onAdddCredit()
                  // {
                  //   showModalBottomSheet(
                  //       context: context,
                  //       isScrollControlled: true,
                  //       constraints: const BoxConstraints(maxWidth: 600),
                  //       builder: (context) {
                  //         return AddCreditSheetView(
                  //           currency: selectedWalletIndex != null
                  //               ? wallet[selectedWalletIndex!].currency
                  //               : "USD",
                  //         );
                  //       });
                  // }
                  ),
              const SizedBox(width: 8),
              if (onRedeemGiftCard != null)
                SizedBox(
                  width: 1,
                  height: 20,
                  child: Container(color: CustomTheme.primaryColors.shade200),
                ),
              const SizedBox(width: 8),
              if (onRedeemGiftCard != null)
                CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: CustomTheme.primaryColors.shade300,
                              borderRadius: BorderRadius.circular(30)),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1),
                              child: Icon(Ionicons.gift,
                                  size: 16,
                                  color: CustomTheme.primaryColors.shade600),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(titleRedeemGiftCard,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: CustomTheme.primaryColors.shade200))
                      ],
                    ),
                    onPressed: () => onRedeemGiftCard!()),
            ],
          )
        ],
      ),
    );
  }
}

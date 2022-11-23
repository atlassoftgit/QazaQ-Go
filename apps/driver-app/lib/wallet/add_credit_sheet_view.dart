import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../generated/l10n.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import '../widgets/query_result_view.dart';
import 'package:client_shared/wallet/payment_method_item.dart';
import 'package:client_shared/wallet/money_presets_group.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';
import '../data/images.dart';

class AddCreditSheetView extends StatefulWidget {
  final String currency;

  const AddCreditSheetView({required this.currency, Key? key}) : super(key: key);

  @override
  State<AddCreditSheetView> createState() => _AddCreditSheetViewState();
}

class _AddCreditSheetViewState extends State<AddCreditSheetView> {
  String? selectedGatewayId;
  double? amount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          )),
      child: SafeArea(
        minimum: EdgeInsets.only(
            top: 16, left: 16, right: 16, bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                S.of(context).wallet_add_credit,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black,
                    ),
                overflow: TextOverflow.visible,
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(Images.iconCreditCard),
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    child: Image.asset(Images.iconCreditLogo),
                  ),
                ],
              ),
            ),
            Query(
              options: QueryOptions(document: PAYMENT_GATEWAYS_QUERY_DOCUMENT),
              builder: (QueryResult result,
                  {Future<QueryResult?> Function()? refetch, FetchMore? fetchMore}) {
                if (result.isLoading || result.hasException) {
                  return QueryResultView(result);
                }
                final gateways = PaymentGateways$Query.fromJson(result.data!).paymentGateways;
                return Column(
                  children: gateways
                      .map(
                        (gateway) => PaymentMethodItem(
                          id: gateway.id,
                          title: gateway.title,
                          selectedValue: selectedGatewayId,
                          imageAddress:
                              gateway.media != null ? serverUrl + gateway.media!.address : null,
                          onSelected: (value) {
                            setState(
                              () => selectedGatewayId = gateway.id,
                            );
                          },
                        ),
                      )
                      .toList(),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).choose_amount,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            MoneyPresetsGroup(
              titleCustom: S.of(context).custom,
              onAmountChanged: (value) => setState(() => amount = value),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(23))),
              child: Mutation(
                options: MutationOptions(document: TOP_UP_WALLET_MUTATION_DOCUMENT),
                builder: (RunMutation runMutation, QueryResult? result) {
                  return ElevatedButton(
                    onPressed:
                        (result?.isLoading ?? false) || amount == null || selectedGatewayId == null
                            ? null
                            : () async {
                                // const phoneNumber = '+7777777777';
                                // Our custom payment
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (_) => PaymentView(
                                //       amount: amount!,
                                //       phoneNumber: phoneNumber,
                                //     ),
                                //   ),
                                // );
                                final mutationResult = await runMutation(TopUpWalletArguments(
                                  input: TopUpWalletInput(
                                    gatewayId: selectedGatewayId!,
                                    amount: amount!,
                                    currency: 'RUB',
                                  ),
                                ).toJson())
                                    .networkResult;
                                final resultParsed =
                                    TopUpWallet$Mutation.fromJson(mutationResult!.data!);
                                launchUrl(Uri.parse(resultParsed.topUpWallet.url));
                                Navigator.pop(context);
                              },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      S.of(context).top_up_sheet_pay_button,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

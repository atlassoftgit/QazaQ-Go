import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/wallet/wallet_card_view.dart';
import 'package:client_shared/wallet/wallet_activity_item_view.dart';
import '../config.dart';
import '../generated/l10n.dart';
import 'add_credit_sheet_view.dart';
import '../data/images.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import '../widgets/query_result_view.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  int? selectedWalletIndex;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Query(
          options: QueryOptions(document: WALLET_QUERY_DOCUMENT),
          builder: (QueryResult result, {Refetch? refetch, FetchMore? fetchMore}) {
            if (result.isLoading || result.hasException) {
              return QueryResultView(result);
            }
            final query = Wallet$Query.fromJson(result.data!);
            final wallet = query.driverWallets;
            final transactions = query.driverTransacions.edges;

            if (wallet.isNotEmpty && selectedWalletIndex == null) {
              selectedWalletIndex = 0;
            }

            final walletItem = wallet.isEmpty ? null : wallet[selectedWalletIndex ?? 0];
            return SafeArea(
              minimum: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RidyBackButton(titleRidyBackButton: S.of(context).back),
                  WalletCardView(
                    titleRidyWallet: S.of(context).menu_wallet,
                    titleAddCredit: S.of(context).wallet_add_credit,
                    titleRedeemGiftCard: S.of(context).redeem_gift_card,
                    currency: walletItem?.currency ?? defaultCurrency,
                    credit: walletItem?.balance ?? 0,
                    onAdddCredit: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        constraints: const BoxConstraints(maxWidth: 600),
                        builder: (context) {
                          return AddCreditSheetView(
                            currency: walletItem?.currency ?? defaultCurrency,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  Text(
                    S.of(context).wallet_activities_heading,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: colorScheme.onSecondaryContainer,
                        ),
                  ),
                  const SizedBox(height: 12),
                  if (transactions.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final item = transactions[index].node;
                            return WalletActivityItemView(
                              title: item.action == TransactionAction.recharge
                                  ? getRechargeText(item.rechargeType!)
                                  : getDeductText(context, item.deductType!),
                              dateTime: item.createdAt,
                              amount: item.amount,
                              currency: item.currency,
                              image: getTransactionIcon(item),
                            );
                          }),
                    ),
                  if (transactions.isEmpty)
                    Expanded(
                      child: Center(
                        child: Text(S.of(context).wallet_empty_state_message),
                      ),
                    ),
                ],
              ),
            );
          }),
    );
  }

  String getDeductText(BuildContext context, DriverDeductTransactionType deductType) {
    switch (deductType) {
      case DriverDeductTransactionType.commission:
        return S.of(context).enum_driver_deduct_transaction_type_commission;

      case DriverDeductTransactionType.correction:
        return S.of(context).enum_driver_deduct_transaction_type_correction;

      case DriverDeductTransactionType.withdraw:
        return S.of(context).enum_driver_deduct_transaction_type_withdraw;

      case DriverDeductTransactionType.artemisUnknown:
        return S.of(context).enum_unknown;
    }
  }

  String getRechargeText(DriverRechargeTransactionType type) {
    switch (type) {
      case DriverRechargeTransactionType.bankTransfer:
        return S.of(context).enum_driver_recharge_type_bank_transfer;

      case DriverRechargeTransactionType.gift:
        return S.of(context).enum_driver_recharge_type_gift;

      case DriverRechargeTransactionType.inAppPayment:
        return S.of(context).enum_driver_recharge_type_in_app_payment;

      case DriverRechargeTransactionType.orderFee:
        return S.of(context).enum_driver_recharge_transaction_type_order_fee;

      default:
        return S.of(context).enum_unknown;
    }
  }

  getTransactionIcon(
      Wallet$Query$DriverTransacionConnection$DriverTransacionEdge$DriverTransacion transacion) {
    if (transacion.action == TransactionAction.recharge) {
      switch (transacion.rechargeType) {
        case DriverRechargeTransactionType.bankTransfer:
          return Images.iconBankTransfer;

        case DriverRechargeTransactionType.gift:
          return Images.iconCommission;

        case DriverRechargeTransactionType.orderFee:
          return Images.iconOrderFree;

        case DriverRechargeTransactionType.inAppPayment:
          return Images.iconCommission;

        default:
          return Images.iconCommission;
      }
    } else {
      switch (transacion.deductType) {
        case DriverDeductTransactionType.commission:
          return Images.iconCommission;

        default:
          return Images.iconCommission;
      }
    }
  }
}

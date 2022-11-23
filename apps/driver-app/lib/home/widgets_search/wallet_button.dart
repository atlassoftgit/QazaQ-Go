import 'package:client_shared/components/user_avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/images.dart';
import '../../main_bloc.dart';

class WalletButton extends StatelessWidget {
  const WalletButton({
    required this.state,
    Key? key,
  }) : super(key: key);

  final MainState state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'earnings'),
      child: Container(
        padding: const EdgeInsets.only(left: 14),
        height: 55,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              (state.driver?.wallets.length ?? 0) > 0
                  ? NumberFormat.simpleCurrency(
                          name: state.driver!.wallets.first.currency)
                      .format(state.driver!.wallets.first.balance)
                  : "-",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 85,
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: UserAvatarView(
                      cornerRadius: 35,
                      size: 50,
                      image: Images.iconUser,
                    ),
                  ),
                  Positioned(
                    left: 5,
                    bottom: 10,
                    child: Container(
                      height: 35,
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 2.0,
                              offset: Offset(0.0, 0.75)
                          )
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Image.asset(
                        Images.iconWallet,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

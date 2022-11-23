import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../generated/l10n.dart';
import '../login/login_number_view.dart';
import '../main/bloc/jwt_cubit.dart';

class OnboardingSignIn extends StatelessWidget {
  final Function() onNextClicked;

  const OnboardingSignIn({Key? key, required this.onNextClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    height: 370,
                    decoration: BoxDecoration(
                        color: CustomTheme.primaryColors.shade100,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(70),
                            bottomRight: Radius.circular(70))),
                  ),
                ),
                const SizedBox(width: 10)
              ],
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Container(
                    constraints:
                        const BoxConstraints(maxWidth: 400, maxHeight: 400),
                    child: Image.asset(
                      "images/onboarding-4.png",
                    ),
                  ),
                  const SizedBox(height: 24),
                  DotsIndicator(
                    dotsCount: 4,
                    position: 3,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 9.0),
                      color: CustomTheme.neutralColors.shade300,
                      activeColor: CustomTheme.primaryColors,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        AutoSizeText(
          S.of(context).onboarding_sign_in_title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: AutoSizeText(
            S.of(context).onboarding_sign_in_body,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 50,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              onPressed: () => Hive.box('settings').put('onboarding', 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: AutoSizeText(S.of(context).action_skip_for_now),
              )),
        ),
        const SizedBox(height: 16),
        CupertinoButton(
          child: AutoSizeText(S.of(context).menu_login),
          onPressed: () async {
            await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                constraints: const BoxConstraints(maxWidth: 600),
                builder: (context) {
                  return BlocProvider.value(
                    value: context.read<JWTCubit>(),
                    child: const LoginNumberView(),
                  );
                });
            Hive.box('settings').put('onboarding', 1);
          },
        )
      ],
    );
  }
}

import 'package:client_shared/theme/theme.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import 'package:velocity_x/velocity_x.dart';

class UnregisteredDriverMessagesView extends StatelessWidget {
  final BasicProfileMixin? driver;

  const UnregisteredDriverMessagesView({required this.driver, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, packageInfo) => Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: CustomTheme.primaryColors.shade200,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(70))),
                child: SafeArea(
                  minimum: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "images/QazaQGOdriver.png",
                              width: 42,
                              height: 42,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "QazaQ Driver",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        'images/registration-illustration.png',
                        width: 300,
                        height: 300,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              )),
          Flexible(
            child: Stack(
              children: [
                Positioned(
                  left: -70,
                  right: -70,
                  top: 30,
                  child: Image.asset(
                    'images/dotted-lines-1.png',
                  ),
                ),
                if (driver == null)
                  const Center(
                    child: NotLoggedInUnregisteredView(),
                  ),
                if (driver?.status == DriverStatus.waitingDocuments)
                  const Center(
                    child: WaitingToCompleteSubmissionUnregisteredView(),
                  ),
                if (driver?.status == DriverStatus.pendingApproval)
                  const Center(child: RegistrationSubmittedUnregisteredView()),
                if (driver?.status == DriverStatus.softReject)
                  Center(
                    child: SoftRejectUnregisteredView(
                        rejectionNote: driver?.softRejectionNote),
                  ),
                if (driver?.status == DriverStatus.hardReject)
                  const Center(
                    child: HardRejectUnregisteredView(),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NotLoggedInUnregisteredView extends StatelessWidget {
  const NotLoggedInUnregisteredView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          S.of(context).welcome,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 300,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: Text(S.of(context).sign_up_now)),
        )
      ],
    );
  }
}

class WaitingToCompleteSubmissionUnregisteredView extends StatelessWidget {
  const WaitingToCompleteSubmissionUnregisteredView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: CustomTheme.neutralColors.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                S.of(context).welcome,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "${S.of(context).please_complete_your} \n${S.of(context).registration_submission}",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: CustomTheme.neutralColors.shade600),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 300,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: Text(S.of(context).complete_registration)),
        )
      ],
    );
  }
}

class RegistrationSubmittedUnregisteredView extends StatelessWidget {
  const RegistrationSubmittedUnregisteredView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: CustomTheme.neutralColors.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                S.of(context).welcome,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "${S.of(context).your_submission_is_under_review},\n${S.of(context).thanks_for_patience}.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: CustomTheme.neutralColors.shade600),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 300,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: Text(S.of(context).edit_submission)),
        )
      ],
    );
  }
}

class HardRejectUnregisteredView extends StatelessWidget {
  const HardRejectUnregisteredView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: CustomTheme.neutralColors.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                S.of(context).welcome,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Ionicons.close_circle,
                    color: Color(0xffb20d0e),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    S.of(context).your_submission_is_fully_rejected,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: const Color(0xffb20d0e)),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SoftRejectUnregisteredView extends StatelessWidget {
  final String? rejectionNote;

  const SoftRejectUnregisteredView({required this.rejectionNote, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: CustomTheme.neutralColors.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                S.of(context).welcome,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Ionicons.close_circle,
                    color: Color(0xffb20d0e),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    S.of(context).there_is_a_problem_with_the_submission,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: const Color(0xffb20d0e)),
                  ),
                ],
              ),
              if (!rejectionNote.isEmptyOrNull)
                Text(
                  rejectionNote ?? "",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: const Color(0xffb20d0e)),
                )
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 300,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: Text(
                S.of(context).edit_submission,
                style: const TextStyle(color: Color(0xffb20d0e)),
              )),
        )
      ],
    );
  }
}

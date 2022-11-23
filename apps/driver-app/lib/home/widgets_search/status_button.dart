
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../generated/l10n.dart';
import '../../graphql/generated/graphql_api.dart';
import '../../main_bloc.dart';

class StatusButton extends StatelessWidget {
  const StatusButton({
    required this.state,
    Key? key,
  }) : super(key: key);

  final MainState state;

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    final colorScheme = Theme.of(context).colorScheme;

    Future<String?> getFcmId(BuildContext context) async {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: false,
        provisional: true,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title:
                      Text(S.of(context).message_notification_permission_title),
                  content: Text(S
                      .of(context)
                      .message_notification_permission_denined_message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).action_ok),
                    )
                  ],
                ));
        return null;
      } else {
        return messaging.getToken(
          vapidKey: "",
        );
      }
    }

    return Mutation(
      options:
          MutationOptions(document: UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT),
      builder: (RunMutation runMutation, QueryResult? result) {
        return Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              offset: Offset(0, 3),
              blurRadius: 15,
            )
          ]),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: (state is StatusOffline)
                ? SizedBox(
                    width: 215,
                    child: FloatingActionButton.extended(
                      key: const Key('offline'),
                      heroTag: 'fabOffline',
                      elevation: 0,
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                      onPressed: (result?.isLoading ?? false)
                          ? null
                          : () async {
                              final fcmId = await getFcmId(context);
                              final res = await runMutation(
                                UpdateDriverStatusArguments(
                                  status: DriverStatus.online,
                                  fcmId: fcmId,
                                ).toJson(),
                              ).networkResult;
                              final driver =
                                  UpdateDriverStatus$Mutation.fromJson(
                                      res!.data!);
                              mainBloc.add(
                                DriverUpdated(driver.updateOneDriver),
                              );
                            },
                      label: Text(
                        S.of(context).statusOffline,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      icon: const ImageIcon(
                        AssetImage('images/offline.png'),
                      ),
                    ),
                  )
                : ((state is StatusOnline)
                    ? SizedBox(
                        width: 215,
                        child: FloatingActionButton.extended(
                          key: const Key('online'),
                          heroTag: 'fabOnline',
                          elevation: 0,
                          onPressed: (result?.isLoading ?? false)
                              ? null
                              : () async {
                                  final res = await runMutation(
                                    UpdateDriverStatusArguments(
                                      status: DriverStatus.offline,
                                    ).toJson(),
                                  ).networkResult;
                                  final driver =
                                      UpdateDriverStatus$Mutation.fromJson(
                                          res!.data!);
                                  mainBloc.add(
                                    DriverUpdated(driver.updateOneDriver),
                                  );
                                },
                          label: Text(
                            S.of(context).statusOnline,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: colorScheme.onTertiary,
                                ),
                          ),
                          backgroundColor: colorScheme.tertiary,
                          icon: ImageIcon(
                            const AssetImage('images/online.png'),
                            color: colorScheme.onTertiary,
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 10,
                      )),
          ),
        );
      },
    );
  }
}

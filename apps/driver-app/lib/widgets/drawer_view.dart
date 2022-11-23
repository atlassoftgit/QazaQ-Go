import 'package:client_shared/components/user_avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:collection/collection.dart';

import '../config.dart';
import '../data/images.dart';
import '../generated/l10n.dart';
import '../graphql/generated/graphql_api.graphql.dart';

class DrawerView extends StatelessWidget {
  final BasicProfileMixin? driver;

  const DrawerView({required this.driver, Key? key}) : super(key: key);

  void _switchThemeMode() {
    var theme = ThemeMode.values.firstWhereOrNull(
        (element) => element.toString() == Hive.box('user').get('theme'));
    theme = theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    Hive.box('user').put('theme', theme.toString());
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.background,
      child: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 45),
            SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Row(
                    children: [
                      UserAvatarView(
                        urlPrefix: serverUrl,
                        url: driver?.media?.address,
                        cornerRadius: 60,
                        size: 90,
                        backgroundColor: colorScheme.secondaryContainer,
                        image: Images.iconUser,
                      ),
                      const SizedBox(height: 5),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              driver?.firstName != null ||
                                      driver?.lastName != null
                                  ? "${driver?.firstName ?? " "} ${driver?.lastName ?? " "}"
                                  : "-",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: colorScheme.onSecondaryContainer,
                                  ),
                            ).pOnly(left: 16),
                            Text(
                              'Nomad',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: const Color(0xffD6D6D6),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '5.0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        color: const Color(0xffD6D6D6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                SizedBox(
                                  height: 10,
                                  child: Image.asset(Images.iconStar),
                                ),
                              ],
                            )
                          ]),
                    ],
                  ),
                  Positioned(
                    left: 60,
                    top: 0,
                    child: SizedBox(
                      width: 45,
                      child: Image.asset(Images.iconBaatyr),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            WidgetDrawerTile(
              title: S.of(context).earnings,
              icon: Images.iconStats,
              onTap: () {
                Navigator.pushNamed(context, 'earnings');
              },
            ),
            WidgetDrawerTile(
              title: S.of(context).menu_announcements,
              icon: Images.iconAnnouncements,
              onTap: () {
                Navigator.pushNamed(context, 'announcements');
              },
            ),
            WidgetDrawerTile(
              title: S.of(context).menu_wallet,
              icon: Images.iconWallet,
              onTap: () {
                Navigator.pushNamed(context, 'wallet');
              },
            ),
            WidgetDrawerTile(
              title: S.of(context).menu_trip_history,
              icon: Images.iconTripHistory,
              onTap: () {
                Navigator.pushNamed(context, 'trip-history');
              },
            ),
            WidgetDrawerTile(
              title: S.of(context).menu_about,
              icon: Images.iconAbout,
              onTap: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                showAboutDialog(
                    context: context,
                    applicationIcon: Image.asset(
                      'images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                    applicationVersion: packageInfo.version,
                    applicationName: packageInfo.appName,
                    applicationLegalese:
                        S.of(context).copyright_notice(companyName));
              },
            ),
            const Spacer(),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              leading: Icon(
                Theme.of(context).colorScheme.brightness == Brightness.dark
                    ? CupertinoIcons.moon_stars_fill
                    : CupertinoIcons.sun_max_fill,
                color: colorScheme.onSecondaryContainer,
                size: 36,
              ),
              minLeadingWidth: 20.0,
              title: Text(
                S.of(context).theme_mode,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: colorScheme.onSecondaryContainer,
                    ),
              ),
              onTap: _switchThemeMode,
            ),
            const SizedBox(
              height: 10,
            ),
            WidgetDrawerTile(
                title: S.of(context).menu_logout,
                icon: Images.iconLogout,
                onTap: () async {
                  final logoutDialogResult = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(S.of(context).menu_logout),
                      content: Text(S.of(context).log_out_desc),
                      actions: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 2);
                                },
                                child: Text(
                                  S.of(context).delete_account.split(' ').first,
                                  style: const TextStyle(
                                    color: Color(0xffb20d0e),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () async {
                                  Navigator.pop(context, 1);
                                  await Hive.box('user').delete('jwt');
                                },
                                child: Text(S.of(context).action_ok)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 0);
                                },
                                child: Text(S.of(context).action_cancel))
                          ],
                        )
                      ],
                    ),
                  );
                  if (logoutDialogResult != 2) return;
                  showDialog(
                    context: context,
                    builder: (BuildContext ncontext) {
                      return AlertDialog(
                        title: Text(S.of(context).account_deletion),
                        content: Text(S.of(context).account_deletion_desc),
                        actions: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Mutation(
                                    options: MutationOptions(
                                        document:
                                            DELETE_USER_MUTATION_DOCUMENT),
                                    builder: (RunMutation runMutation,
                                        QueryResult? result) {
                                      return TextButton(
                                          onPressed: () async {
                                            await runMutation({}).networkResult;
                                            await Hive.box('user')
                                                .delete('jwt');
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            S.of(context).delete_account,
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(
                                                color: Color(0xffb20d0e)),
                                          ));
                                    }),
                              ),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    S.of(context).action_cancel,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}

class WidgetDrawerTile extends StatelessWidget {
  const WidgetDrawerTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      leading: Image.asset(
        icon,
        color: colorScheme.onSecondaryContainer,
        width: 35,
        height: 35,
      ),
      minLeadingWidth: 20.0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: colorScheme.onSecondaryContainer,
            ),
      ),
      onTap: onTap,
    );
  }
}

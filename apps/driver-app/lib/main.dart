import 'package:client_shared/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lifecycle/lifecycle.dart';
import 'chat/chat_view.dart';
import 'home/service/map_mode_cubit.dart';
import 'home/service/map_objects_cubit.dart';
import 'widgets/current_location_cubit.dart';
import 'earnings/earnings_view.dart';
import 'home/home_page.dart';
import 'package:collection/collection.dart';

import 'announcements/announcements_view.dart';
import 'config.dart';
import 'generated/l10n.dart';
import 'main_bloc.dart';
import 'profile/profile_view.dart';
import 'trip-history/trip_history_list_view.dart';
import 'wallet/wallet_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'graphql_provider.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();
  await Firebase.initializeApp();
  await Hive.openBox('user');
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const RestartWidget(child: MyApp()));
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({required this.child, Key? key}) : super(key: key);

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, Box box, widget) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<MainBloc>(lazy: false, create: (context) => MainBloc()),
            BlocProvider<MapObjectsCubit>(lazy: false, create: (context) => MapObjectsCubit()),
            BlocProvider<MapModeCubit>(lazy: false, create: (context) => MapModeCubit()),
            BlocProvider<CurrentLocationCubit>(
              lazy: false,
              create: (context) => CurrentLocationCubit(),
            )
          ],
          child: MyGraphqlProvider(
            uri: "${serverUrl}graphql",
            subscriptionUri: "${wsUrl}graphql",
            jwt: box.get('jwt').toString(),
            child: MaterialApp(
              title: 'Ridy',
              navigatorObservers: [defaultLifecycleObserver],
              debugShowCheckedModeBanner: false,
              theme: CustomTheme.lightTheme,
              darkTheme: CustomTheme.darkTheme,
              themeMode: ThemeMode.values.firstWhereOrNull(
                  (element) => element.toString() == Hive.box('user').get('theme')),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              routes: {
                'register': (context) => const ProfileView(),
                'trip-history': (context) => const TripHistoryListView(),
                'announcements': (context) => const AnnouncementsView(),
                'earnings': (context) => const EarningsView(),
                'chat': (context) => const ChatView(),
                'wallet': (context) => const WalletView(),
              },
              home: MyHomePage(),
            ),
          ),
        );
      },
    );
  }
}

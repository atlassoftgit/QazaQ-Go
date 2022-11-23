import 'package:client_shared/config.dart';
import 'package:country_codes/country_codes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:ridy/chat/chat_view.dart';
import 'package:ridy/location_selection/location_selection_parent_view.dart';
import 'package:ridy/location_selection/welcome_card/location_history_item.dart';
import 'package:ridy/main/bloc/jwt_cubit.dart';
import 'package:ridy/main/bloc/map_objects_cubit.dart';
import 'package:ridy/main/bloc/rider_profile_cubit.dart';
import 'package:ridy/program/program_view.dart';
import 'address/address_list_view.dart';
import 'announcements/announcements_list_view.dart';
import 'history/trip_history_list_view.dart';
import 'main/bloc/current_location_cubit.dart';
import 'main/bloc/driver_placemarks_cubit.dart';
import 'main/bloc/main_bloc.dart';
import 'main/graphql_provider.dart';
import 'onboarding/onboarding_view.dart';
import 'profile/profile_view.dart';
import 'reservations/reservation_list_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'wallet/wallet_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:geolocator/geolocator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHiveForFlutter();
  await Firebase.initializeApp();
  Hive.registerAdapter(LocationHistoryItemAdapter());
  await Hive.openBox<List<LocationHistoryItem>>("history2");
  await Hive.openBox("user");
  await Hive.openBox('settings');
  if (!kIsWeb) {
    await CountryCodes.init();
    final locale = CountryCodes.detailsForLocale();
    if (locale.dialCode != null) {
      defaultCountryCode = locale.dialCode!;
    }
  }
  await Geolocator.requestPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainBloc()),
        BlocProvider(create: (context) => CurrentLocationCubit()),
        BlocProvider(create: (context) => RiderProfileCubit()),
        BlocProvider(create: (context) => JWTCubit()),
        BlocProvider(create: (context) => MapObjectsCubit()),
        BlocProvider(create: (context) => DriverPlacemarksCubit()),
      ],
      child: MyGraphqlProvider(
        child: ValueListenableBuilder<Box>(
            valueListenable: Hive.box('settings')
                .listenable(keys: ['language', 'onboarding']),
            builder: (context, box, snapshot) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorObservers: [defaultLifecycleObserver],
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: box.get('language') != null
                    ? Locale.fromSubtags(languageCode: box.get('language'))
                    : null,
                routes: {
                  'addresses': (context) => const AddressListView(),
                  'announcements': (context) => const AnnouncementsListView(),
                  'history': (context) => const TripHistoryListView(),
                  'wallet': (context) => const WalletView(),
                  'chat': (context) => const ChatView(),
                  'reserves': (context) => const ReservationListView(),
                  'program': (context) => const ProgramView(),
                  'profile': (context) => BlocProvider.value(
                        value: context.read<RiderProfileCubit>(),
                        child: BlocProvider.value(
                          value: context.read<JWTCubit>(),
                          child: ProfileView(),
                        ),
                      )
                },
                themeMode: ThemeMode.light,
                darkTheme: CustomTheme.darkTheme,
                theme: CustomTheme.lightTheme,
                home: box.get('onboarding', defaultValue: 0) > 0
                    ? const LocationSelectionParentView()
                    : OnBoardingView(),
              );
            }),
      ),
    );
  }
}

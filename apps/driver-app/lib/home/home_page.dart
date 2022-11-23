import 'package:client_shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'service/map_objects_cubit.dart';
import '../data/global_variables.dart';
import '../widgets/drawer_view.dart';

import '../data/keys.dart';
import '../main_bloc.dart';
import '../widgets/unregistered_driver_messages_view.dart';
import 'widgets_map/map_provider.dart';
import 'widgets_map/map_screen.dart';
import 'service/map_mode_cubit.dart';
import 'widgets_navigator/navigator_screen.dart';

@immutable
class MyHomePage extends StatelessWidget with WidgetsBindingObserver {
  MyHomePage({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    mapEngine.mapObjects = BlocProvider.of<MapObjectsCubit>(context);

    return Scaffold(
      key: scaffoldKey,
      drawer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Drawer(
          backgroundColor: CustomTheme.primaryColors.shade100,
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return DrawerView(
                driver: state.driver,
              );
            },
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('user').listenable(),
        builder: (context, Box box, widget) {
          if (box.get('jwt') == null) {
            return const UnregisteredDriverMessagesView(
              driver: null,
            );
          }

          return Stack(
            children: [
              MapProvider(
                key: mapKey,
              ),
              BlocBuilder<MapModeCubit, MapMode>(builder: (context, state) {
                switch (state) {
                  case MapMode.map:
                    return MapScreen();
                  case MapMode.navigator:
                    return const NavigatorScreen();
                }
              })
            ],
          );
        },
      ),
    );
  }
}

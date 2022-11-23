import 'package:bloc/bloc.dart';

import '../../data/global_variables.dart';

enum MapMode {
  map,
  navigator,
}

class MapModeCubit extends Cubit<MapMode> {
  MapModeCubit() : super(MapMode.map);

  switchToMap() {
    mapEngine.switchMode(MapMode.map);
    emit(MapMode.map);
  }

  switchToNavigator() {
    mapEngine.switchMode(MapMode.navigator);
    emit(MapMode.navigator);
  }
}

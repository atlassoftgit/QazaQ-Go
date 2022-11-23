import 'package:bloc/bloc.dart';
import 'package:client_shared/utility/yandex_map_functions.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/global_variables.dart';

class MapObjectsCubit extends Cubit<List<MapObject>> {
  MapObjectsCubit() : super([]);

  clearObjects() {
    if (state.isNotEmpty) {
      emit([]);
    }
  }

  setObjects(List<MapObject> objects) {
    emit(objects);
  }
}

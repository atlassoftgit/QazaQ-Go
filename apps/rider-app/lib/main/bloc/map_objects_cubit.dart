import 'package:bloc/bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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

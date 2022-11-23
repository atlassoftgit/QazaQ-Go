import 'package:bloc/bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DriverPlacemarksCubit extends Cubit<List<MapObject>> {
  DriverPlacemarksCubit() : super([]);

  clearObjects() {
    if (state.isNotEmpty) {
      emit([]);
    }
  }

  setObjects(List<MapObject> objects) {
    print(objects.length);
    emit(objects);
  }
}

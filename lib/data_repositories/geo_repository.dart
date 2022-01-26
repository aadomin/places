import 'dart:math';
import 'package:places/domain_models/object_location.dart';
import 'package:places/main.dart';

///
/// Класс обеспечивает получение из внешнего источника координат пользователя (со спутника)
///
class GeoRepository {
  ///
  /// текущие координаты пользователя
  ObjectLocation get currentUserLocation {
    final random = Random();
    // режим для отладки - пользователь стоит на месте
    if (isDebugUserStay) {
      return ObjectLocation(
        latitude: 54,
        longitude: 54,
      );
    }
    // режим для отладки - пользователь оказывается в разных местах
    else if (isDebugUserMove) {
      return ObjectLocation(
        latitude: random.nextDouble() * 20 + 40,
        longitude: random.nextDouble() * 20 + 40,
      );
    }
    // базовый режим - получение координат со спутника - нереализован
    else {
      // TODO(me): implement user locator
      throw Exception('Unimplemented');
    }
  }
}

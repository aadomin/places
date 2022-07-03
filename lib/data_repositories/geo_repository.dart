import 'dart:math';
import 'package:places/domain_models/object_location.dart';
import 'package:places/main.dart';

///
/// Репозиторий координат.
/// Класс обеспечивает получение из внешнего источника координат
/// пользователя (например, со спутника)
///
class GeoRepository {
  ///
  /// Возвращает текущие координаты пользователя
  /// 
  PointGetCoordinates get currentUserLocation {
    // режим для отладки - пользователь стоит на месте
    if (isDebugUserStay) {
      return PointGetCoordinates(
        latitude: 54,
        longitude: 54,
      );
    }
    // режим для отладки - пользователь оказывается в разных местах
    else if (isDebugUserMove) {
      final random = Random();
      return PointGetCoordinates(
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

import 'dart:math';
import 'package:places/domain_entities/object_location.dart';
import 'package:places/main.dart';

/// Repository of user coordinates. Getting it from outer storage
class GeoRepository {
  ///
  /// Current user coordinates
  ///
  PointGetCoordinates get currentUserLocation {
    switch (debugUserLocation) {
      case DebugUserLocation.fixed:
        return PointGetCoordinates(
          latitude: 54,
          longitude: 54,
        );
      case DebugUserLocation.changing:
        final random = Random();
        return PointGetCoordinates(
          latitude: random.nextDouble() * 20 + 40,
          longitude: random.nextDouble() * 20 + 40,
        );
      case DebugUserLocation.takenFromServer:
        // TODO(me): implement user locator
        throw Exception('Unimplemented');
    }
  }
}

import 'dart:math';
import 'package:places/domain_models/object_location.dart';
import 'package:places/main.dart';

class GeoRepository {
  ObjectLocation get currentUserLocation {
    final random = Random();
    if (isDebugUserStay) {
      return ObjectLocation(
        latitude: 54,
        longitude: 54,
      );
    } else if (isDebugUserMove) {
      return ObjectLocation(
        latitude: random.nextDouble() * 20 + 40,
        longitude: random.nextDouble() * 20 + 40,
      );
    } else {
      // TODO(me): implement user locator
      throw Exception('Unimplemented');
    }
  }
}

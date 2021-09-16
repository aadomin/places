import 'dart:math';

import 'package:places/data/models/object_location.dart';

class GeoRepository {
  ObjectLocation get currentUserLocation {
    //TODO implement user locator
    final random = Random();

    return ObjectLocation(
      latitude: random.nextDouble() * 20 + 40,
      longitude: random.nextDouble() * 20 + 40,
    );
  }
}

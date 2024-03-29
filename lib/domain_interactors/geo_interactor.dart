import 'dart:math';
import 'package:places/data_repositories/geo_repository.dart';

///
/// Интерактор. Геолокация
///
class GeoInteractor {
  GeoInteractor({
    required this.geoRepository,
  });

  final GeoRepository geoRepository;

  /// дистанция от точки до пользователя
  double distanceFromPointToUser({
    required double lat,
    required double lon,
  }) {
    final currentUserLocation = geoRepository.currentUserLocation;
    return _distanceInKmBetweenEarthCoordinates(
      lat1: lat,
      lon1: lon,
      lat2: currentUserLocation.latitude,
      lon2: currentUserLocation.longitude,
    );
  }

  /// дистанция в километрах между двумя координатами
  double _distanceInKmBetweenEarthCoordinates({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    const double earthRadiusKm = 6371;

    final double dLat = _degreesToRadians(lat2 - lat1);
    final double dLon = _degreesToRadians(lon2 - lon1);

    final radLat1 = _degreesToRadians(lat1);
    final radLat2 = _degreesToRadians(lat2);

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLon / 2) * sin(dLon / 2) * cos(radLat1) * cos(radLat2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadiusKm * c;
  }

  /// перевод градусов в радианы
  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}

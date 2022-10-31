import 'package:places/data_repositories/places/dto/place_dto.dart';
import 'package:places/domain_entities/place.dart';

PlaceDto mapPlaceToPlaceDto(Place e) {
  final String? placeType = _reversedReplaceTable[e.type];

  if (placeType == null) throw Exception('not valid api');

  return PlaceDto(
    id: e.id,
    lat: e.lat,
    lng: e.lon,
    name: e.name,
    urls: ['https://hive.com'], //TODO(me): url
    placeType: placeType,
    description: e.details,
  );
}

Place mapPlaceDtoToPlace(PlaceDto e) {
  final String? type = _replaceTable[e.placeType];

  if (type == null) throw Exception('not valid api');

  return Place(
    id: e.id.toInt(),
    name: e.name,
    lat: e.lat.toDouble(),
    lon: e.lng.toDouble(),
    urls: e.urls,
    details: e.description,
    type: type,
  );
}

final Map<String, String> _replaceTable = {
  'monument': 'Особое место',
  'theatre': 'Особое место',
  'museum': 'Музей',
  'park': 'Парк',
  'hotel': 'Отель',
  'restaurant': 'Ресторан',
  'temple': 'Особое место',
  'cafe': 'Кафе',
  'other': 'Особое место',
};

final Map<String, String> _reversedReplaceTable =
    _replaceTable.map((key, value) => MapEntry(value, key));

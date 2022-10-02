import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_get_api.freezed.dart';
part 'places_get_api.g.dart';

// flutter pub run build_runner build

@freezed
class PlacesGetAPI with _$PlacesGetAPI {
  const factory PlacesGetAPI({
    required List<PlaceDto> places,
  }) = _PlacesGetAPI;

  factory PlacesGetAPI.fromJson(Map<String, Object?> json) =>
      _$PlacesGetAPIFromJson(json);
}

@freezed
class PlaceDto with _$PlaceDto {
  const factory PlaceDto({
    required int id,
    required double lat,
    required double lng,
    required String name,
    required List<String> urls,
    required String placeType,
    required String description,
  }) = _PlaceDto;

  factory PlaceDto.fromJson(Map<String, Object?> json) =>
      _$PlaceDtoFromJson(json);
}

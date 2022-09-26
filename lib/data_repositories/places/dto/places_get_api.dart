import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_get_api.freezed.dart';
part 'places_get_api.g.dart';

// flutter pub run build_runner build

@freezed
class PlacesGetAPI with _$PlacesGetAPI {
  const factory PlacesGetAPI({
    required List<PlaceDTO> places,
  }) = _PlacesGetAPI;

  factory PlacesGetAPI.fromJson(Map<String, Object?> json) =>
      _$PlacesGetAPIFromJson(json);
}

@freezed
class PlaceDTO with _$PlaceDTO {
  const factory PlaceDTO({
    required int id,
    required double lat,
    required double lng,
    required String name,
    required List<String> urls,
    required String placeType,
    required String description,
  }) = _PlaceDTO;

  factory PlaceDTO.fromJson(Map<String, Object?> json) =>
      _$PlaceDTOFromJson(json);
}

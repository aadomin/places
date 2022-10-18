// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/data_repositories/places/dto/place_dto.dart';

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

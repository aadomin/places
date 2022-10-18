// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_dto.freezed.dart';
part 'place_dto.g.dart';

// flutter pub run build_runner build

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

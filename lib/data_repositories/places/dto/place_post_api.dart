import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_post_api.freezed.dart';
part 'place_post_api.g.dart';

// flutter pub run build_runner build

@freezed
class PlacePostAPI with _$PlacePostAPI {
  const factory PlacePostAPI({
    required int id,
    required double lat,
    required double lng,
    required String name,
    required List<String> urls,
    required String placeType,
    required String description,
  }) = _PlacePostAPI;

  factory PlacePostAPI.fromJson(Map<String, Object?> json) =>
      _$PlacePostAPIFromJson(json);
}

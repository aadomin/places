// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain_entities/category_item.dart';

// flutter pub run build_runner build
part 'filter_settings.freezed.dart';
part 'filter_settings.g.dart';


///
/// Модель состояния фильтра
///
@freezed
class FilterSettings with _$FilterSettings {
  const factory FilterSettings({
    required List<CategoryItem> filterItemsState,
    required int radiusOfSearch,
  }) = _FilterSettings;

  factory FilterSettings.fromJson(Map<String, Object?> json) =>
      _$FilterSettingsFromJson(json);
}

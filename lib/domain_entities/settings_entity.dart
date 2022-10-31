// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain_entities/filter_settings.dart';

part 'settings_entity.freezed.dart';
part 'settings_entity.g.dart';
// flutter pub run build_runner build

@freezed
class SettingsEntity with _$SettingsEntity {
  const factory SettingsEntity({
    required bool isDarkThemeOn,
    required FilterSettings filterSettings,
    required bool isThatTheFirstRun,
  }) = _SettingsEntity;

  factory SettingsEntity.fromJson(Map<String, Object?> json) =>
      _$SettingsEntityFromJson(json);
}

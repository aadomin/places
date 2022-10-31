// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:places/domain_entities/filter_settings.dart';

part 'settings_dto.freezed.dart';
part 'settings_dto.g.dart';

// flutter pub run build_runner build

@freezed
class SettingsDto with _$SettingsDto {
  const factory SettingsDto({
    required bool? isDarkThemeOn,
    required FilterSettings? filterSettings,
    required bool? isThatTheFirstRun,
  }) = _SettingsDto;

  factory SettingsDto.fromJson(Map<String, Object?> json) =>
      _$SettingsDtoFromJson(json);
}

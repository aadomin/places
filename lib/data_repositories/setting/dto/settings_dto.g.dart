// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsDto _$$_SettingsDtoFromJson(Map<String, dynamic> json) =>
    _$_SettingsDto(
      isDarkThemeOn: json['isDarkThemeOn'] as bool?,
      filterSettings: json['filterSettings'] == null
          ? null
          : FilterSettings.fromJson(
              json['filterSettings'] as Map<String, dynamic>),
      isThatTheFirstRun: json['isThatTheFirstRun'] as bool?,
    );

Map<String, dynamic> _$$_SettingsDtoToJson(_$_SettingsDto instance) =>
    <String, dynamic>{
      'isDarkThemeOn': instance.isDarkThemeOn,
      'filterSettings': instance.filterSettings,
      'isThatTheFirstRun': instance.isThatTheFirstRun,
    };

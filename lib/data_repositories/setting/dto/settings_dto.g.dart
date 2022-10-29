// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsDto _$$_SettingsDtoFromJson(Map<String, dynamic> json) =>
    _$_SettingsDto(
      isDarkThemeOn: json['isDarkThemeOn'] as bool,
      filterCondition: FilterSettings.fromJson(
          json['filterCondition'] as Map<String, dynamic>),
      isThatTheFirstRun: json['isThatTheFirstRun'] as bool,
    );

Map<String, dynamic> _$$_SettingsDtoToJson(_$_SettingsDto instance) =>
    <String, dynamic>{
      'isDarkThemeOn': instance.isDarkThemeOn,
      'filterCondition': instance.filterCondition,
      'isThatTheFirstRun': instance.isThatTheFirstRun,
    };

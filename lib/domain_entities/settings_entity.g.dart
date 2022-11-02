// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsEntity _$$_SettingsEntityFromJson(Map<String, dynamic> json) =>
    _$_SettingsEntity(
      isDarkThemeOn: json['isDarkThemeOn'] as bool,
      filterSettings: FilterSettings.fromJson(
          json['filterSettings'] as Map<String, dynamic>),
      isThatTheFirstRun: json['isThatTheFirstRun'] as bool,
    );

Map<String, dynamic> _$$_SettingsEntityToJson(_$_SettingsEntity instance) =>
    <String, dynamic>{
      'isDarkThemeOn': instance.isDarkThemeOn,
      'filterSettings': instance.filterSettings,
      'isThatTheFirstRun': instance.isThatTheFirstRun,
    };

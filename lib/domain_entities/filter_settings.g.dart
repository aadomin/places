// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilterSettings _$$_FilterSettingsFromJson(Map<String, dynamic> json) =>
    _$_FilterSettings(
      filterItemsState: (json['filterItemsState'] as List<dynamic>)
          .map((e) => CategoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      radiusOfSearch: json['radiusOfSearch'] as int,
    );

Map<String, dynamic> _$$_FilterSettingsToJson(_$_FilterSettings instance) =>
    <String, dynamic>{
      'filterItemsState': instance.filterItemsState,
      'radiusOfSearch': instance.radiusOfSearch,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_get_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlacesGetAPI _$$_PlacesGetAPIFromJson(Map<String, dynamic> json) =>
    _$_PlacesGetAPI(
      places: (json['places'] as List<dynamic>)
          .map((e) => PlaceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlacesGetAPIToJson(_$_PlacesGetAPI instance) =>
    <String, dynamic>{
      'places': instance.places,
    };

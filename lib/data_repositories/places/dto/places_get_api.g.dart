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

_$_PlaceDto _$$_PlaceDtoFromJson(Map<String, dynamic> json) => _$_PlaceDto(
      id: json['id'] as int,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
      placeType: json['placeType'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_PlaceDtoToJson(_$_PlaceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'urls': instance.urls,
      'placeType': instance.placeType,
      'description': instance.description,
    };

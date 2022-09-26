// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_post_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlacePostAPI _$$_PlacePostAPIFromJson(Map<String, dynamic> json) =>
    _$_PlacePostAPI(
      id: json['id'] as int,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      urls: (json['urls'] as List<dynamic>).map((e) => e as String).toList(),
      placeType: json['placeType'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_PlacePostAPIToJson(_$_PlacePostAPI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'urls': instance.urls,
      'placeType': instance.placeType,
      'description': instance.description,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_add_place_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreenAddPlaceState _$$_ScreenAddPlaceStateFromJson(
        Map<String, dynamic> json) =>
    _$_ScreenAddPlaceState(
      currentlySelectedCategory: json['currentlySelectedCategory'] as String,
      listOfPhotos: (json['listOfPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isButtonSaveActive: json['isButtonSaveActive'] as bool,
    );

Map<String, dynamic> _$$_ScreenAddPlaceStateToJson(
        _$_ScreenAddPlaceState instance) =>
    <String, dynamic>{
      'currentlySelectedCategory': instance.currentlySelectedCategory,
      'listOfPhotos': instance.listOfPhotos,
      'isButtonSaveActive': instance.isButtonSaveActive,
    };

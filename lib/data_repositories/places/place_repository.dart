import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data_repositories/places/dto/places_get_api.dart';
import 'package:places/data_repositories/places/mappers/place_and_place_dto.dart';
import 'package:places/ui_commons/exceptions.dart';
import 'package:places/domain_entities/place.dart';

///
/// Places Repository
///
class PlaceRepository {
  PlaceRepository({
    required this.dio,
  });

  final Dio dio;

  ///
  /// Load all places and return them
  ///
  Future<List<Place>> getAllPlaces() async {
    const String _path = '/place';
    final Response response = await dio.get<String>(_path);

    debugPrint(response.statusCode.toString());
    if (response.statusCode != 200) {
      // in general, 200 201 300 - it's success too
      throw NetworkException(
        queryPath: response.realUri.path,
        errorName: '${response.statusCode} ${response.statusMessage}',
      );
    }

    //cheat code for api model parsing as object, not list of objects
    String rawJson = '{"places": ${response.data.toString()}}';

    return PlacesGetAPI.fromJson(jsonDecode(rawJson))
        .places
        .map(mapPlaceDtoToPlace)
        .toList();
  }

  ///
  /// Add place on server
  ///
  Future<void> addPlace(Place newPlace) async {
    const String _path = '/place';

    final placeDto = mapPlaceToPlaceDto(newPlace);

    final Response response =
        await dio.post<String>(_path, data: placeDto.toJson());

    if (response.statusCode != 200) {
      throw NetworkException(
        queryPath: _path,
        errorName: '${response.statusCode} ${response.statusMessage}',
      );
    } else {
      debugPrint('Place added on the server');
    }
  }
}

//TODO(me): return error catching

// /// Old version - parsing
  // List<Place> _parsePlaces(String rawJson) {
  //   final List postListJson = jsonDecode(rawJson) as List;
  //   return postListJson
  //       //ignore: avoid_annotating_with_dynamic
  //       .map((dynamic placeJson) =>
  //           Place.fromJson(placeJson as Map<String, dynamic>))
  //       .toList();
  // }
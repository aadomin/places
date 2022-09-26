import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data_repositories/places/dto/place_post_api.dart';
import 'package:places/data_repositories/places/dto/places_get_api.dart';
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

    // old version
    // final List<Place> _loadedPlaces = _parsePlaces(response.data.toString());

    String rawJson = '{"places": ${response.data.toString()}}';

    // ТУТВОПРОС - is that right place for mapping models?

    // if (replaceTable[e.placeType] is! String) throw Exception('json error');

    return PlacesGetAPI.fromJson(jsonDecode(rawJson)).places.map(
      (e) {
        return Place(
          id: e.id.toInt(),
          name: e.name,
          lat: e.lat.toDouble(),
          lon: e.lng.toDouble(),
          url: e.urls,
          details: e.description,
          type: (_replaceTable[e.placeType] is String)
              ? _replaceTable[e.placeType]!
              : _replaceTable['other']!,
          //TODO(me): опасно
        );
      },
    ).toList();
  }

  // /// Old version - parsing
  // List<Place> _parsePlaces(String rawJson) {
  //   final List postListJson = jsonDecode(rawJson) as List;
  //   return postListJson
  //       //ignore: avoid_annotating_with_dynamic
  //       .map((dynamic placeJson) =>
  //           Place.fromJson(placeJson as Map<String, dynamic>))
  //       .toList();
  // }

  ///
  /// Add place on server
  ///
  Future<void> addPlace(Place newPlace) async {
    const String _path = '/place';

    final Map<String, String> reversedReplaceTable =
        _replaceTable.map((key, value) => MapEntry(value, key));

    final placePostApi = PlacePostAPI(
      id: newPlace.id,
      lat: newPlace.lat,
      lng: newPlace.lon,
      name: newPlace.name,
      urls: ['https://hive.com'], //TODO(me): url
      placeType: (reversedReplaceTable[newPlace.type] is String)
          ? reversedReplaceTable[newPlace.type]!
          : reversedReplaceTable['Особое место']!,
      description: newPlace.details,
    );

    final Response response =
        await dio.post<String>(_path, data: placePostApi.toJson());

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

final Map<String, String> _replaceTable = {
  'other': 'Особое место',
  'monument': 'Особое место',
  'theatre': 'Особое место',
  'museum': 'Музей',
  'park': 'Парк',
  'hotel': 'Отель',
  'restaurant': 'Ресторан',
  'temple': 'Особое место',
  'cafe': 'Кафе',
};

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data_api/places_get_api.dart';
import 'package:places/ui_commons/exceptions.dart';
import 'package:places/domain_models/place.dart';

///
/// Репозиторий. Обеспечивает хранение мест
///
class PlaceRepository {
  PlaceRepository({
    required this.dio,
  });

  final Dio dio;

  ///
  /// Загружает все места и возвращает их
  ///
  Future<List<Place>> getAllPlaces() async {
    const String _path = '/place';

    try {
      final Response response = await dio.get<String>(
        _path,
      );
      debugPrint(response.statusCode.toString());
      if (response.statusCode != 200) {
        //200 201 300 - тоже успех
        // TODO(me): переделать обработку ошибок
        throw NetworkException(
          queryPath: response.realUri.path,
          errorName: '${response.statusCode} ${response.statusMessage}',
        );
      }
      // final List<Place> _loadedPlaces = _parsePlaces(response.data.toString());

      String rawJson = '{"places": ${response.data.toString()}}';

      final List<PlaceDTO> _listOfPlacesDTO =
          PlacesGetAPI.fromJson(jsonDecode(rawJson)).places;

      final Map<String, String> replaceTable = {
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

      return PlacesGetAPI.fromJson(jsonDecode(rawJson)).places.map(
        (e) {
          return Place(
            id: e.id.toInt(),
            name: e.name,
            lat: e.lat.toDouble(),
            lon: e.lng.toDouble(),
            url: e.urls,
            details: e.description,
            type: replaceTable[e.placeType.toString] ?? 'Особое место',
          );
        },
      ).toList();
    } on NetworkException catch (e) {
      debugPrint('${e.errorName}, ${e.queryPath}, ${e.toString()}');
      return [];
      //ignore: avoid_catches_without_on_clauses
    } catch (e) {
      //ТУТ ВОПРОС
      debugPrint(e.toString());
      return [];
    }
  }

  ///
  /// Распарсить результат с сервера - Места
  ///
  List<Place> _parsePlaces(String rawJson) {
    final List postListJson = jsonDecode(rawJson) as List;
    return postListJson
        //ignore: avoid_annotating_with_dynamic
        .map((dynamic placeJson) =>
            Place.fromJson(placeJson as Map<String, dynamic>))
        .toList();
  }

  ///
  /// Добавить место на сервер
  ///
  Future<void> addPlace(Place newPlace) async {
    const String _path = '/place';
    try {
      final Response response =
          await dio.post<String>(_path, data: newPlace.toJson());
      if (response.statusCode != 200) {
        throw NetworkException(
          queryPath: _path,
          errorName: '${response.statusCode} ${response.statusMessage}',
        );
      } else {
        debugPrint('Place added on the server');
      }
    } on NetworkException catch (e) {
      debugPrint(e.toString());
      return;
    }
    return;
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data_other/exceptions.dart';
import 'package:places/data_other/mocks.dart';

import 'package:places/domain_models/place.dart';
import 'package:places/main.dart';

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
    if (isDebugMockDataInPlaceOfHttp) {
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      // TODO(me): переделать мокирование
      return mocks;
    } else {
      const String _path = '/place';

      try {
        final Response response = await dio.get<String>(
          _path,
        );
        debugPrint(response.statusCode.toString());
        if (response.statusCode != 200) {
          // TODO(me): переделать обработку ошибок
          throw NetworkException(
            queryPath: response.realUri.path,
            errorName: '${response.statusCode} ${response.statusMessage}',
          );
        }
        final List<Place> _loadedPlaces =
            _parsePlaces(response.data.toString());
        return _loadedPlaces;
      } on NetworkException catch (e) {
        debugPrint('${e.errorName}, ${e.queryPath}, ${e.toString()}');
        return [];
        //ignore: avoid_catches_without_on_clauses
      } catch (e) { //ТУТ ВОПРОС
        debugPrint(e.toString());
        return [];
      }
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
    if (isDebugMockDataInPlaceOfHttp) {
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      return;
    } else {
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
}

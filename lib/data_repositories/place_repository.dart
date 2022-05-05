import 'dart:convert';
import 'package:dio/dio.dart';
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

  bool isRequestDoneWithError = false;

  ///
  /// Загружает все места и возвращает их
  ///
  Future<List<Place>> getAllPlaces() async {
    if (isDebugMockDataInPlaceOfHttp) {
      await Future<dynamic>.delayed(const Duration(seconds: 3));

      isRequestDoneWithError = false;
      return mocks;
    } else {
      const String _path = '/place';

      List<Place> _loadedPlaces = []; // сюда загрузим
      try {
        final Response response = await dio.get<String>(
          _path,
        );
        print(response.statusCode);
        if (response.statusCode != 200) {
          throw NetworkException(
            queryPath: response.realUri.path,
            errorName: '${response.statusCode} ${response.statusMessage}',
          );
        }
        _loadedPlaces = _parsePlaces(response.data.toString());
      } on NetworkException catch (e) {
        isRequestDoneWithError = true;
        print('${e.errorName}, ${e.queryPath}, ${e.toString()}');
        return [];
        //ignore: avoid_catches_without_on_clauses
      } catch (e) {
        isRequestDoneWithError = true;
        print(e);
        return [];
      }
      isRequestDoneWithError = false;
      return _loadedPlaces;
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
      isRequestDoneWithError = false;
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
          print('Place added on the server');
        }
      } on NetworkException catch (e) {
        isRequestDoneWithError = true;
        print(e);
        return;
      }
      isRequestDoneWithError = false;
      return;
    }
  }
}

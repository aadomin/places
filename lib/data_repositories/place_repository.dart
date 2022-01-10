import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:places/data_other/exceptions.dart';
import 'package:places/data_repositories/mocks.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_my_app/my_app.dart';

late final Dio dio;

class PlaceRepository {
  PlaceRepository() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://test-backend-flutter.surfstudio.ru',
      connectTimeout: 5000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
      // ignore: avoid_redundant_argument_values
      responseType: ResponseType.json,
    );
    dio = Dio(baseOptions);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print(
            'Запрос: ${options.method} ${options.path} ${options.queryParameters}',
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Ответ получен ${response.data.toString().substring(0, 100)} ');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          NetworkException(
            queryPath: '',
            errorName: 'dio error',
          );
          return handler.next(e);
        },
      ),
    );
  }

  List<Place> loadedPlaces = [];

  bool isRequestDoneWithError = false;

  Future<void> loadPlaces() async {
    if (isDebugMockDataInPlaceOfHttp) {
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      loadedPlaces = mocks;
      isRequestDoneWithError = false;
      return;
    } else {
      const String _path = '/place';

      try {
        final Response response = await dio.get<String>(
          _path,
        );
        print(response.statusCode);
        if (response.statusCode != 200) {
          throw NetworkException(
            queryPath: _path,
            errorName: '${response.statusCode} ${response.statusMessage}',
          );
        }
        loadedPlaces = parsePlaces(response.data.toString());
      } on NetworkException catch (e) {
        isRequestDoneWithError = true;
        print(e);
        return;
        //ignore: avoid_catches_without_on_clauses
      } catch (e) {
        isRequestDoneWithError = true;
        print(e);
        return;
      }
      isRequestDoneWithError = false;
      return;
    }
  }

  List<Place> parsePlaces(String rawJson) {
    final List postListJson = jsonDecode(rawJson) as List;
    return postListJson
        //ignore: avoid_annotating_with_dynamic
        .map((dynamic placeJson) =>
            Place.fromJson(placeJson as Map<String, dynamic>))
        .toList();
  }

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

  List<String> listOfInitialPhotosForAdding = [
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
  ];
}

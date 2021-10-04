import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:places/data/models/place.dart';
import 'package:places/data/repositories/mocks.dart';
import 'package:places/ui/my_app/my_app.dart';

import 'package:places/exceptions.dart';

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

  late final Dio dio;

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
}

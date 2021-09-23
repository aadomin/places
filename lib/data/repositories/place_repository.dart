import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:places/data/models/place.dart';
import 'package:places/data/repositories/mocks.dart';
import 'package:places/ui/my_app/my_app.dart';

class PlaceRepository {
  Future<List<Place>> loadPlaces() async {
    if (isDebugMockDataInPlaceOfHttp) {
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      return mocks;
    } else {
      final baseOptions = BaseOptions(
        baseUrl: 'https://test-backend-flutter.surfstudio.ru',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        sendTimeout: 5000,
        // ignore: avoid_redundant_argument_values
        responseType: ResponseType.json,
      );
      final dio = Dio(baseOptions);

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            print('Запрос: ${options.method} ${options.path} ${options.queryParameters}');
            return handler.next(options);
          },
          onResponse: (response, handler) {
            print('Ответ получен ${response.data} ');
            return handler.next(response);
          },
          onError: (DioError e, handler) {
            return handler.next(e);
          },
        ),
      );

      final Response response = await dio.get<String>(
        '/place',
      );
      if (response.statusCode != 200) {
        throw Exception('http error. Error code ${response.statusCode}');
      }
      return parsePlaces(response.data.toString());
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
      return;
    } else {
      final baseOptions = BaseOptions(
        baseUrl: 'https://test-backend-flutter.surfstudio.ru',
        connectTimeout: 5000,
        receiveTimeout: 5000,
        sendTimeout: 5000,
        // ignore: avoid_redundant_argument_values
        responseType: ResponseType.json,
      );
      final dio = Dio(baseOptions);

      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            print('Запрос: ${options.data}');
            return handler.next(options);
          },
          onResponse: (response, handler) {
            print('Ответ получен ${response.data} ');
            return handler.next(response);
          },
          onError: (DioError e, handler) {
            return handler.next(e);
          },
        ),
      );

      final Response response =
          await dio.post<String>('/place', data: newPlace.toJson());

      if (response.statusCode != 200) {
        throw Exception('http error. Error code ${response.statusCode}');
      }
      return;
    }
  }
}

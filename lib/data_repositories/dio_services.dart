import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/ui_commons/exceptions.dart';

///
/// Сервис отвечающий за отправку и прием http запросов
///
class DioServices {
  DioServices() {
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
          debugPrint(
            'Запрос: ${options.method} ${options.path} ${options.queryParameters}',
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          final txtFromResponse = response.data.toString();
          final txtFromResponseCropped = txtFromResponse.length <= 201
              ? txtFromResponse
              : txtFromResponse.substring(0, 200);
          debugPrint('Ответ получен $txtFromResponseCropped ');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          // DioError взять статус-код
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
}

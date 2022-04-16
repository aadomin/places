import 'package:dio/dio.dart';
import 'package:places/data_other/exceptions.dart';

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
}

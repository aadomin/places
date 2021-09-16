import 'package:dio/dio.dart';

BaseOptions baseOptions = BaseOptions(
  baseUrl: 'https://test-backend-flutter.surfstudio.ru',
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  responseType: ResponseType.json,
);
final dio = Dio(baseOptions);

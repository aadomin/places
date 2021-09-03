import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PlaceRepository {
  PlaceRepository() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'http://jsonplaceholder.typicode.com',
      connectTimeout: 10000,
      receiveTimeout: 10000,
      sendTimeout: 10000,
      responseType: ResponseType.json,
      // headers: {"device-Info:": "Nokia 3310 OS 14"},
    );

    final dio = Dio(baseOptions);
  }
}

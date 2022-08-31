import 'package:flutter/material.dart';

class NetworkException implements Exception {
  NetworkException({
    required this.queryPath,
    required this.errorName,
  }) {
    // ignore: unnecessary_this
    debugPrint(this.toString());
  }

  final String queryPath;
  final String errorName;

  @override
  String toString() => 'В запросе $queryPath возникла ошибка: $errorName';
}

import 'dart:math';

import 'package:flutter/material.dart';

/// 
/// Интерактор - имитация сложной загрузки
/// 
class HardworkInteractor {
  /// имитация сложной загрузки
  void hardwork() {
    debugPrint('Hard work started');

    List<String> list = [];
    final random = Random();

    // создаем большой список
    // ignore: avoid_types_on_closure_parameters
    list = List.generate(200000, (int index) => random.nextDouble().toString());

    debugPrint(list.toString().substring(0, 100));

    // выполняем тяжелую функцию
    list = list.map((str) => str.split('').reversed.join()).toList();

    debugPrint(list.toString().substring(0, 100));
    debugPrint('Hard work done');
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class HardworkServices with ChangeNotifier {
  /// имитация сложной загрузки
  void hardWork() {
    print('Hard work started');

    List<String> list = [];
    final random = Random();

    // ignore: avoid_types_on_closure_parameters
    list = List.generate(200000, (int index) => random.nextDouble().toString());
    print(list.toString().substring(0, 100));

    list = list.map((str) => str.split('').reversed.join()).toList();
    print(list.toString().substring(0, 100));

    print('Hard work done');
  }
}
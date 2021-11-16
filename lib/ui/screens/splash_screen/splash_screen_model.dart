import 'dart:math';
import 'package:flutter/material.dart';

import 'package:places/ui_my_app/routes.dart';

class SplashScreenModel {
  // ignore: avoid_void_async
  static void initAppAndThenChangeScreen(BuildContext context) async {
    print('starting of application');
    final _delayProcess = _doDelayForBeautifulChangeScreen();
    await _doInitializeApp();
    await _delayProcess;
    await Navigator.of(context).pushReplacementNamed(ROUTE_ONBOARDING);
  }

  /// процедура загрузки: Future
  static Future<void> _doInitializeApp() async {
    print('loading started at: ${DateTime.now()}');
    _hardWork();
    print('loading done at: ${DateTime.now()}');
  }

  /// задержка для красоты (если загрузка выполнилась меньше чем за 2 секунды)
  static Future<bool> _doDelayForBeautifulChangeScreen() async {
    print('delaying started at: ${DateTime.now()}');
    await Future<dynamic>.delayed(const Duration(seconds: 2));
    print('delaying done at: ${DateTime.now()}');
    return true;
  }

  /// имитация сложной загрузки
  static void _hardWork() {
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

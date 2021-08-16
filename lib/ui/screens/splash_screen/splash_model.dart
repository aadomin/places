import 'package:flutter/material.dart';
import 'package:places/ui/my_app/routes.dart';
import 'dart:math';

class MySplashModel with ChangeNotifier {
  static void initAppAndThenChangeScreen(BuildContext context) async {
    print('starting of application');
    var _delayProcess = _doDelayForBeautifulChangeScreen();
    _doInitializeApp();
    await _delayProcess;
    Navigator.of(context).pushReplacementNamed(ROUTE_ONBOARDING);
  }

  /// процедура загрузки: синхронная
  static void _doInitializeApp() {
    print("loading started at: ${DateTime.now()}");
    _hardWork();
    print("loading done at: ${DateTime.now()}");
  }

  /// задержка для красоты (если загрузка выполнилась меньше чем за 2 секунды)
  static Future<bool> _doDelayForBeautifulChangeScreen() async {
    print("delaying started at: ${DateTime.now()}");
    await Future.delayed(Duration(seconds: 2));
    print("delaying done at: ${DateTime.now()}");
    return true;
  }

  /// имитация сложной загрузки
  static void _hardWork() {
    List<String> list = [];
    var random = Random();

    list = List.generate(200000, (int index) => random.nextDouble().toString());
    print(list.toString().substring(0, 100));

    list = list.map((str) => str.split('').reversed.join()).toList();
    print(list.toString().substring(0, 100));
  }
}

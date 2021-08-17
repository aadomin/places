import 'package:flutter/material.dart';
import 'package:places/ui/my_app/routes.dart';
import 'dart:isolate';
import 'dart:math';

class MySplashModel with ChangeNotifier {
  static void initAppAndThenChangeScreen(BuildContext context) async {
    print('starting of application');
    var _delayProcess = _doDelayForBeautifulChangeScreen();
    await _doInitializeApp();
    await _delayProcess;
    Navigator.of(context).pushReplacementNamed(ROUTE_ONBOARDING);
  }

  /// процедура загрузки: в изоляте
  static Future<void> _doInitializeApp() async {
    print("loading started at: ${DateTime.now()}");

    final port = ReceivePort();
    final isolate = await Isolate.spawn(_hardWork, port.sendPort);
    await for (dynamic message in port) {
      if (message == 'done') {
        isolate.kill();
        break;
      }
    }
    print("loading done at: ${DateTime.now()}");
  }

  /// задержка для красоты (если загрузка выполнилась меньше чем за 2 секунды)
  static Future<bool> _doDelayForBeautifulChangeScreen() async {
    print("delaying started at: ${DateTime.now()}");
    await Future.delayed(Duration(seconds: 2));
    print("delaying done at: ${DateTime.now()}");
    return true;
  }
}

/// имитация сложной загрузки
void _hardWork(SendPort port) {
  print('Hello. I am isolate');

  List<String> list = [];
  var random = Random();

  list = List.generate(200000, (int index) => random.nextDouble().toString());
  print(list.toString().substring(0, 100));

  list = list.map((str) => str.split('').reversed.join()).toList();
  print(list.toString().substring(0, 100));

  port.send('Isolate done');
}

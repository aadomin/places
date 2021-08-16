import 'package:flutter/material.dart';
import 'package:places/ui/my_app/routes.dart';
import 'package:places/ui/res/UiImagePaths.dart';
import 'dart:isolate';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// имитация загрузки
  Future<bool> isInitialized() async {
    await Future.delayed(Duration(seconds: 2));
    print("loading done");
    return true;
  }

  /// задержка для красоты (если загрузка выполнилась меньше чем за 2 секунды)
  Future<bool> isDelayDone() async {
    await Future.delayed(Duration(seconds: 2));
    print("delaying done");
    return true;
  }

  @override
  void initState() {
    _navigateToNext();
    super.initState();
  }

  void _navigateToNext() async {
    print('starting of application');
    var initProcess = isInitialized();
    var delayProcess = isDelayDone();
    await initProcess;
    await delayProcess;
    Navigator.of(context).pushReplacementNamed(ROUTE_ONBOARDING);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4CAF50),
              Color(0xffFCDD3D),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            UiImagePaths.logo,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}

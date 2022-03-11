import 'package:flutter/material.dart';
import 'package:places/main.dart';

class MyAppAndRoutesVM with ChangeNotifier {
  MyAppAndRoutesVM({required this.context}) {
    settingsEntity.addListener(_settingsEntityListener);
  }

  void _settingsEntityListener() => notifyListeners();

  BuildContext context;

  bool get isDarkThemeOn => settingsEntity.isDarkThemeOn;
}

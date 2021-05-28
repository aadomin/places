import 'package:flutter/material.dart';

// Model for storing (and dynamically updating) theme of app
class MyThemeModel with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}

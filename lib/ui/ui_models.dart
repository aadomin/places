import 'package:flutter/material.dart';

// Положил модель в эту папку, чтобы не захламлять этой вспомогательной моделью папки с реальными моделями, которые наверно появятся позже. 

// Модель для динамического обновления темы
class MyThemeModel with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}

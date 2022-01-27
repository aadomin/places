import 'package:flutter/material.dart';
import 'package:places/main.dart';

///
/// Интерактор выбора категории
///
class SettingsInteractor with ChangeNotifier {
  void changeTheme() {
    settingsEntity.changeTheme();
    notifyListeners();
  }

  bool get isDarkThemeOn => settingsEntity.isDarkThemeOn;
}

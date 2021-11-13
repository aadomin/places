import 'package:flutter/material.dart';
import 'package:places/main.dart';

class SettingsInteractor with ChangeNotifier {
  // Singleton
  factory SettingsInteractor() => _instance ?? SettingsInteractor._internal();
  static SettingsInteractor? _instance;
  SettingsInteractor._internal() {
    _instance = this;
  }

  void changeTheme() {
    settingsEntity.changeTheme();
    notifyListeners();
  }

  bool get isDarkThemeOn => settingsEntity.isDarkThemeOn;
}

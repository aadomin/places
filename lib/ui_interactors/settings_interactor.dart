import 'package:flutter/material.dart';
import 'package:places/main.dart';

class SettingsInteractor with ChangeNotifier {
  // Singleton
  factory SettingsInteractor() => _instance ?? SettingsInteractor._internal();
  SettingsInteractor._internal() {
    _instance = this;
  }
  static SettingsInteractor? _instance;

  void changeTheme() {
    settingsEntity.changeTheme();
    notifyListeners();
  }

  bool get isDarkThemeOn => settingsEntity.isDarkThemeOn;
}

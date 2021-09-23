// Напишите SettingsInteractor в котором происходит логика смены темной/светлой темы
// Подключите интерактор к экрану настроек

import 'package:flutter/material.dart';
import 'package:places/data/repositories/settings_repository.dart';

class SettingsInteractor with ChangeNotifier {
  // Singleton
  factory SettingsInteractor() => _instance ?? SettingsInteractor._internal();
  SettingsInteractor._internal() {
    _instance = this;
  }
  static SettingsInteractor? _instance;
  //

  final settingsRepository = SettingsRepository();

  void changeTheme() {
    settingsRepository.isDarkThemeOn = !settingsRepository.isDarkThemeOn;
    notifyListeners();
  }

  bool get isDarkThemeOn => settingsRepository.isDarkThemeOn;
}

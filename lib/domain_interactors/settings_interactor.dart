import 'package:flutter/material.dart';
import 'package:places/data_repositories/settings_repository.dart';

///
/// Доменный слой приложения. Базовая бизнес-логика
/// Настройки приложения
///
class SettingsInteractor with ChangeNotifier {
  SettingsInteractor({
    required this.settingsRepository,
  });

  final SettingsRepository settingsRepository;

  void changeTheme() {
    settingsRepository.isDarkThemeOn = !settingsRepository.isDarkThemeOn;
    notifyListeners();
  }

  bool get isDarkThemeOn => settingsRepository.isDarkThemeOn;
}

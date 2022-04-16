import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data_repositories/settings_repository.dart';

///
/// Интерактор настроек приложения
///
class SettingsInteractor with ChangeNotifier {
  SettingsInteractor({
    required this.settingsRepository,
  });

  final SettingsRepository settingsRepository;

  final streamIsDarkThemeOnController = StreamController<bool>();
  Stream<bool> get streamIsDarkThemeOn => streamIsDarkThemeOnController.stream;

  @override
  void dispose() {
    streamIsDarkThemeOnController.close();
    super.dispose();
  }

  void changeTheme() {
    streamIsDarkThemeOnController.add(false);
    settingsRepository.isDarkThemeOn = !settingsRepository.isDarkThemeOn;
    notifyListeners();
  }

  bool get isDarkThemeOn => settingsRepository.isDarkThemeOn;
}

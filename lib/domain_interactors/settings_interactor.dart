import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data_repositories/setting/dto/settings_dto.dart';
import 'package:places/data_repositories/setting/settings_repository.dart';

///
/// Интерактор настроек приложения
///
class SettingsInteractor with ChangeNotifier {
  SettingsInteractor({
    required this.settingsRepository,
  });

  late SettingsDto settings;

  // void initInteractor() {
  //   settings = settingsRepository.getSettings();
  // }

  final SettingsRepository settingsRepository;

  final streamIsDarkThemeOnController = StreamController<bool>();
  Stream<bool> get streamIsDarkThemeOn => streamIsDarkThemeOnController.stream;

  @override
  void dispose() {
    streamIsDarkThemeOnController.close();
    super.dispose();
  }

  void changeTheme() {
    streamIsDarkThemeOnController.add(!settingsRepository.isDarkThemeOn);
    settingsRepository.isDarkThemeOn = !settingsRepository.isDarkThemeOn;
    notifyListeners();
  }

  bool get isDarkThemeOn => settingsRepository.isDarkThemeOn;
}

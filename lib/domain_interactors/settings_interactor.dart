import 'dart:async';

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

  // ТУТВОПРОС - где закрывать sink

  // ignore: close_sinks
  final stateStreamController =
      StreamController<SettingInteractorStateForStream>();
  Stream<SettingInteractorStateForStream> get state =>
      stateStreamController.stream;

  //

  void changeTheme() {
    settingsRepository.isDarkThemeOn = !settingsRepository.isDarkThemeOn;
    notifyListeners();
  }

  bool get isDarkThemeOn => settingsRepository.isDarkThemeOn;

  //
}

// ТУТВОПРОС
class SettingInteractorStateForStream {
  bool inDarkThemeOn = false;
  bool isLoading = false;
  List<String>? justAnotherList;
}

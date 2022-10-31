import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data_repositories/setting/settings_repository.dart';
import 'package:places/domain_entities/category_item.dart';
import 'package:places/domain_entities/filter_settings.dart';
import 'package:places/domain_entities/settings_entity.dart';
import 'package:places/ui_commons/ui_strings.dart';

///
/// Интерактор настроек приложения
///
class SettingsInteractor with ChangeNotifier {
  SettingsInteractor({
    required this.settingsRepository,
  });

  final SettingsRepository settingsRepository;

  //

  late SettingsEntity settings;
  bool get isDarkThemeOn => settings.isDarkThemeOn;

  final streamIsDarkThemeOnController = StreamController<bool>();
  Stream<bool> get streamIsDarkThemeOn => streamIsDarkThemeOnController.stream;

  Future<void> init() async {
    settings = _initialSettings;
    notifyListeners();

    final loadedSettings = await settingsRepository.getSettings();
    if (loadedSettings == null) {
      settingsRepository.setSettings(settings);
    } else {
      settings = loadedSettings;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    streamIsDarkThemeOnController.close();
    super.dispose();
  }

  void changeTheme() {
    settings = settings.copyWith(isDarkThemeOn: !settings.isDarkThemeOn);
    settingsRepository.setSettings(settings);
    notifyListeners();

    //TODO потом улучшить
    streamIsDarkThemeOnController.add(settings.isDarkThemeOn);
  }

  Future<void> resetSettings() async {
    settings = _initialSettings;
    unawaited(settingsRepository.setSettings(settings));
    notifyListeners();

    //TODO потом улучшить
    streamIsDarkThemeOnController.add(settings.isDarkThemeOn);
  }

  Future<void> firstRunAlreadyWas() async {
    settings = settings.copyWith(isThatTheFirstRun: false);
    unawaited(settingsRepository.setSettings(settings));
  }
}

const _initialSettings = SettingsEntity(
  isDarkThemeOn: false,
  filterSettings: _initialFilterSettings,
  isThatTheFirstRun: true,
);

const _initialFilterSettings = FilterSettings(
  filterItemsState: [
    //TODO(me): need to be cleaner
    CategoryItem(name: UiStrings.hotel, isSelected: true),
    CategoryItem(name: UiStrings.restaurant, isSelected: true),
    CategoryItem(name: UiStrings.specialPlace, isSelected: true),
    CategoryItem(name: UiStrings.park, isSelected: true),
    CategoryItem(name: UiStrings.museum, isSelected: true),
    CategoryItem(name: UiStrings.cafe, isSelected: true),
  ],
  radiusOfSearch: 10000,
);

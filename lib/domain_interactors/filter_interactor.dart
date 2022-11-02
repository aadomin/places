import 'package:flutter/material.dart';
import 'package:places/domain_entities/filter_settings.dart';
import 'package:places/domain_interactors/settings_interactor.dart';

///
/// Интерактор. Фильтр по местам
///
class FilterInteractor with ChangeNotifier {
  FilterInteractor({required this.settingsInteractor});

  SettingsInteractor settingsInteractor;

  //

  late FilterSettings _newFilterSettings;
  FilterSettings get newFilterSettings => _newFilterSettings;
  set newFilterSettings(FilterSettings value) {
    _newFilterSettings = value;
    notifyListeners();
  }

  FilterSettings get savedFilterSettings =>
      settingsInteractor.settings.filterSettings;
  set savedFilterSettings(FilterSettings value) {
    settingsInteractor.settings =
        settingsInteractor.settings.copyWith(filterSettings: value);
    notifyListeners();
  }

  void init() {}

  void reloadNewSettings() {
    _newFilterSettings = settingsInteractor.settings.filterSettings;
    notifyListeners();
  }
}

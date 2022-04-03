import 'package:flutter/material.dart';
import 'package:places/domain_interactors/settings_interactor.dart';

class MyAppAndRoutesVM with ChangeNotifier {
  MyAppAndRoutesVM({
    required this.context,
    required this.settingsInteractor,
  });

  BuildContext context;
  final SettingsInteractor settingsInteractor;

  void initVM() {
    settingsInteractor.addListener(_settingsEntityListener);
  }

  void _settingsEntityListener() => notifyListeners();

  void disposeVM() {
    settingsInteractor.removeListener(_settingsEntityListener);
  }

  //

  bool get isDarkThemeOn => settingsInteractor.isDarkThemeOn;
  // ТУТВОПРОС
}

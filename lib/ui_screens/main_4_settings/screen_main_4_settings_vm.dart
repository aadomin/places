import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/domain_interactors/settings_interactor.dart';
import 'package:places/my_app_and_routes.dart';

class ScreenMain4SettingsVM with ChangeNotifier {
  ScreenMain4SettingsVM({
    required this.context,
    required this.settingsInteractor,
  });

  BuildContext context;
  final SettingsInteractor settingsInteractor;

  void initVM() {
    settingsInteractor.addListener(_settingsInteractorListener);
  }

  void _settingsInteractorListener() {
    notifyListeners();
  }

  void disposeVM() {
    settingsInteractor.removeListener(_settingsInteractorListener);
  }

  //

  bool get isDarkThemeOn => settingsInteractor.isDarkThemeOn;

  void onTapOnTutorialLink() {
    Navigator.of(context).pushNamed(appRouteOnboarding);
  }

  void onTapOnThemeSwitch() {
    _changeTheme();
  }

  void onTapOnThemeSwitchTile() {
    _changeTheme();
  }

  void _changeTheme() {
    settingsInteractor.changeTheme();
  }

  Future<void> onResetSettings() async {
    await settingsInteractor.resetSettings();
  }
}

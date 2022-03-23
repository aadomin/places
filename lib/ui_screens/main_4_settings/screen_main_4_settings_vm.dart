import 'package:flutter/material.dart';
import 'package:places/domain_interactors/settings_interactor.dart';
import 'package:places/my_app_and_routes.dart';

class ScreenMain4SettingsVM with ChangeNotifier {
  ScreenMain4SettingsVM({
    required this.context,
    required this.settingsEntity,
  }) {
    settingsEntity.addListener(_settingsEntityListener);
  }

  //method dispose должен быть вызван из виджета

  BuildContext context;
  final SettingsInteractor settingsEntity;
  void _settingsEntityListener() => notifyListeners();

  //

  bool get isDarkThemeOn => settingsEntity.isDarkThemeOn;

  void onTapOnTutorialLink() {
    Navigator.of(context).pushNamed(ROUTE_ONBOARDING);
  }

  void onTapOnThemeSwitch() {
    _changeTheme();
  }

  void onTapOnThemeSwitchTile() {
    _changeTheme();
  }

  void _changeTheme() {
    settingsEntity.changeTheme();
  }
}
import 'package:flutter/material.dart';
import 'package:places/domain_interactors/settings_interactor.dart';
import 'package:places/my_app_and_routes.dart';

class ScreenMain4SettingsVM with ChangeNotifier {
  ScreenMain4SettingsVM({
    required this.context,
    required this.settingsInteractor,
  }) {
    settingsInteractor.addListener(_settingsEntityListener);
  }

  //method dispose должен быть вызван из виджета

  BuildContext context;
  final SettingsInteractor settingsInteractor;
  void _settingsEntityListener() => notifyListeners();

  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  //

  bool get isDarkThemeOn => settingsInteractor.isDarkThemeOn;

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
    settingsInteractor.changeTheme();
  }
}

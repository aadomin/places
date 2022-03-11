import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/my_app_and_routes.dart';

class ScreenMain4SettingsVM with ChangeNotifier {
  ScreenMain4SettingsVM({
    required this.context,
  }) {
    settingsEntity.addListener(_settingsEntityListener);
  }

  void _settingsEntityListener() => notifyListeners();

  BuildContext context;

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

import 'package:flutter/material.dart';
import 'package:places/domain_entities/settings_entity.dart';
import 'package:places/my_app_and_routes.dart';

class ScreenMain4SettingsVM with ChangeNotifier {
  ScreenMain4SettingsVM({
    required this.context,
    required this.settingsEntity,
  }) {
    settingsEntity.addListener(_settingsEntityListener);
  }

  BuildContext context;
  final SettingsEntity settingsEntity;
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

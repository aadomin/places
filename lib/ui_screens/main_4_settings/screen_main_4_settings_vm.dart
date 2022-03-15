import 'package:flutter/material.dart';
import 'package:places/domain_entities/settings_entity.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:provider/provider.dart';

class ScreenMain4SettingsVM with ChangeNotifier {
  ScreenMain4SettingsVM({
    required this.context,
  }) {
    context.read<SettingsEntity>().addListener(_settingsEntityListener);
    
  }

  void _settingsEntityListener() => notifyListeners();

  BuildContext context;

  bool get isDarkThemeOn => context.read<SettingsEntity>().isDarkThemeOn;

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
    context.read<SettingsEntity>().changeTheme();
  }
}

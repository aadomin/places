import 'package:flutter/material.dart';
import 'package:places/domain_entities/settings_entity.dart';
import 'package:provider/provider.dart';

class MyAppAndRoutesVM with ChangeNotifier {
  MyAppAndRoutesVM({required this.context}) {
    context.read<SettingsEntity>().addListener(_settingsEntityListener);
  }

  void _settingsEntityListener() => notifyListeners();

  BuildContext context;

  bool get isDarkThemeOn => context.read<SettingsEntity>().isDarkThemeOn;
}

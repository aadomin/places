import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:provider/provider.dart';

class MyAppAndRoutesVM with ChangeNotifier {
  MyAppAndRoutesVM({required this.context}) {
    // Здесь для сравнения DI на месте
    context.read<DI>().settingsInteractor.addListener(_settingsEntityListener);
  }

  void _settingsEntityListener() => notifyListeners();

  BuildContext context;

  bool get isDarkThemeOn => context.read<DI>().settingsInteractor.isDarkThemeOn;
}

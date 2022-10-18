import 'package:flutter/material.dart';
import 'package:places/domain_interactors/settings_interactor.dart';

class MyAppAndRoutesVM with ChangeNotifier {
  MyAppAndRoutesVM({
    required this.context,
    required this.settingsInteractor,
  });

  BuildContext context;
  final SettingsInteractor settingsInteractor;

  late Stream<bool> streamIsDartThemeOn =
      settingsInteractor.streamIsDarkThemeOn;

  void initVM() {
    //  settingsInteractor.addListener(_settingsInteractorListener);
  }

  // void _settingsInteractorListener() => notifyListeners();

  void disposeVM() {
    // settingsInteractor.removeListener(_settingsInteractorListener);
  }

  bool get isDarkThemeOn => settingsInteractor.isDarkThemeOn;
}

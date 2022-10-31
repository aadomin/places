import 'package:flutter/material.dart';
import 'package:places/domain_interactors/settings_interactor.dart';
import 'package:places/my_app_and_routes.dart';

class ScreenAllMainVM with ChangeNotifier {
  ScreenAllMainVM({
    required this.context,
    required this.settingsInteractor,
  });

  BuildContext context;
  SettingsInteractor settingsInteractor;

  void initVM() {
    _checkFirstRun();
  }

  void disposeVM() {}
  
  //

  int currentPage = 0;

  void _checkFirstRun() {
    if (settingsInteractor.settings.isThatTheFirstRun) {
      // TODO: переделать?
      // for not navigating while method build or something else
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          Navigator.of(context).pushNamed(appRouteOnboarding);
        },
      );

      settingsInteractor.firstRunAlreadyWas();
      // тут без !!! notifyListeners();
    }
  }

  void onTap(int value) {
    currentPage = value;
    notifyListeners();
  }
}

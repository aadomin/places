import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';

class ScreenAllMainVM with ChangeNotifier {
  ScreenAllMainVM({
    required this.context,
  });
  BuildContext context;

  void initVM() {
    if (isThatTheFirstRun) {
      isThatTheFirstRun = false;
      // for not navigating while method build or something else
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          Navigator.of(context).pushNamed(appRouteOnboarding);
        },
      );
    }
  }

  void disposeVM() {}

  //

  int currentPage = 0;

  bool isThatTheFirstRun = true;

  void onTap(int value) {
    currentPage = value;
    notifyListeners();
  }
}

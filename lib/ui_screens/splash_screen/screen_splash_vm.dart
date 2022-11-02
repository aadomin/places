import 'package:flutter/material.dart';

import 'package:places/domain_interactors/hardwork_interactor.dart';
import 'package:places/my_app_and_routes.dart';

///
/// Имитация загрузки приложения
///
class ScreenSplashVM with ChangeNotifier {
  ScreenSplashVM({
    required this.context,
    required this.hardworkInteractor,
  });

  BuildContext context;
  HardworkInteractor hardworkInteractor;

  void initVM() {
    initAppAndThenPopPage(context);
  }

  void disposeVM() {}

  ///
  /// Init
  ///
  Future<void> initAppAndThenPopPage(BuildContext context) async {
    debugPrint('starting application');
    // Run futures
    final _delayProcess = _doDelayForBeautifulChangeScreen();
    final _loadingProcess = _doInitializeApp();

    // Wait for futures
    await _loadingProcess;
    await _delayProcess;

    // ignore: unawaited_futures
    Navigator.of(context).pushReplacementNamed(appRouteHome);
  }

  ///
  /// Loading of app
  ///
  Future<void> _doInitializeApp() async {
    debugPrint('loading started at: ${DateTime.now()}');
    hardworkInteractor.hardwork();
    debugPrint('loading done at: ${DateTime.now()}');
  }

  ///
  /// Delay for beaty (to splash screen was shown in not shorter that 2 seconds)
  ///
  Future<bool> _doDelayForBeautifulChangeScreen() async {
    debugPrint('delaying started at: ${DateTime.now()}');
    await Future<dynamic>.delayed(const Duration(seconds: 2));
    debugPrint('delaying done at: ${DateTime.now()}');
    return true;
  }
}

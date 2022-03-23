import 'package:flutter/material.dart';
import 'package:places/domain_interactors/hardwork_services.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:provider/provider.dart';

///
/// Имитация загрузки приложения
///
class ScreenSplashVM with ChangeNotifier {
  ScreenSplashVM({
    required this.context,
  }) {
    initAppAndThenChangeScreen(context);
  }

  BuildContext context;

  /// Инициализация, одновременно с этим задержка
  /// и после переход к другому экрану
  ///
  // ignore: avoid_void_async
  void initAppAndThenChangeScreen(BuildContext context) async {
    print('starting of application');
    final _delayProcess = _doDelayForBeautifulChangeScreen();
    await _doInitializeApp();
    await _delayProcess;
    await Navigator.of(context).pushReplacementNamed(ROUTE_ONBOARDING);
  }

  ///
  /// Процедура загрузки
  ///
  Future<void> _doInitializeApp() async {
    print('loading started at: ${DateTime.now()}');

    context.read<HardworkServices>().hardWork();

    print('loading done at: ${DateTime.now()}');
  }

  ///
  /// Задержка для красоты (если загрузка выполнилась меньше чем за 2 секунды)
  ///
  Future<bool> _doDelayForBeautifulChangeScreen() async {
    print('delaying started at: ${DateTime.now()}');
    await Future<dynamic>.delayed(const Duration(seconds: 2));
    print('delaying done at: ${DateTime.now()}');
    return true;
  }
}
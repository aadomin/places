import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/splash_screen/screen_splash.dart';
import 'package:places/ui_screens/splash_screen/screen_splash_vm.dart';
import 'package:provider/provider.dart';

class ScreenSplashDI extends StatelessWidget {
  const ScreenSplashDI({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenSplash(
      viewModel: ScreenSplashVM(
        context: context,
        hardworkInteractor: context.read<DI>().hardworkInteractor,
      ),
    );
  }
}

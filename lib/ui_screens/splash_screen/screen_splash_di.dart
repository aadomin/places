import 'package:flutter/material.dart';
import 'package:places/ui_screens/splash_screen/screen_splash.dart';
import 'package:places/ui_screens/splash_screen/screen_splash_vm.dart';

ScreenSplash createScreenSplash({
  required BuildContext context,
}) {
  return ScreenSplash(
    viewModel: ScreenSplashVM(
      context: context,
    ),
  );
}

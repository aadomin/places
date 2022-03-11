import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/themes.dart';
import 'package:places/ui_screens/splash_screen/screen_splash_vm.dart';

/// Экран-заставка во время загрузки
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  late final ScreenSplashVM _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ScreenSplashVM(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4CAF50),
              Color(0xffFCDD3D),
            ],
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            UiImagePaths.logo,
            width: 100,
            height: 100,
            color: Theme.of(context).colorScheme.textOnBottomButtonActive,
          ),
        ),
      ),
    );
  }
}

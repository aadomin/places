import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui_commons/themes.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_screens/splash_screen/screen_splash_vm.dart';

/// Экран-заставка во время загрузки
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final ScreenSplashVM viewModel;

  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  ScreenSplashVM get _viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel.initVM(); //Тут не просто инит, тут работа
  }

  @override
  void dispose() {
    _viewModel.disposeVM();
    super.dispose();
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

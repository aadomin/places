import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
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

class _ScreenSplashState extends State<ScreenSplash>
    with SingleTickerProviderStateMixin {
  ScreenSplashVM get _viewModel => widget.viewModel;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _viewModel.initVM(); //Тут не просто инит, тут работа
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _viewModel.disposeVM();
    _animationController.dispose();
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
          child: SizedBox(
            width: 100,
            height: 100,
            child: Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animationController.value * math.pi * 2,
                    child: child!,
                  );
                },
                child: SvgPicture.asset(
                  UiImagePaths.logo,
                  width: 100,
                  height: 100,
                  color: Theme.of(context).colorScheme.textOnBottomButtonActive,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:places/ui_commons/ui_image_paths.dart';

/// Страница "Добро пожаловать 2"
class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Image.asset(
              UiImagePaths.onboardingPage2,
              width: 100,
              height: 100,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Построй маршрут и отправляйся в путь',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Достигай цели максимально быстро и комфортно',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

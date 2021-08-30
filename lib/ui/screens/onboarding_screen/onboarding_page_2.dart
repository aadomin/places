import 'package:flutter/material.dart';

import 'package:places/ui/res/ui_image_paths.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({
    required PageController pageController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 20),
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

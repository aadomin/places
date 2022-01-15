import 'package:flutter/material.dart';

import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';

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

          // текст Онбординга 21
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              UiStrings.onboarding21,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          // текст Онбординга 22
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              UiStrings.onboarding22,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

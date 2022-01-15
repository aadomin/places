import 'package:flutter/material.dart';

import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// Страница "Добро пожаловать 1"
class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({
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
              UiImagePaths.onboardingPage1,
              width: 100,
              height: 100,
            ),
          ),

          // текст Онбординга 11
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              UiStrings.onboarding11,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          // текст Онбординга 12
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              UiStrings.onboarding12,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

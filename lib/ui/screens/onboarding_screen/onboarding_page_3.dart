import 'package:flutter/material.dart';

import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// Страница "Добро пожаловать 3"
class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({
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
              UiImagePaths.onboardingPage3,
              width: 100,
              height: 100,
            ),
          ),

          // текст Онбординга 31
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              UiStrings.onboarding31,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          // текст Онбординга 32
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              UiStrings.onboarding32,
              textAlign: TextAlign.center,
            ),
          ),

          // кнопка 'На Старт!'
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 60,
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(UiStrings.onboardingGogogo),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:places/ui/my_app/ui_image_paths.dart';

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
            padding: const EdgeInsets.only(top: 70, bottom: 20),
            child: Image.asset(
              UiImagePaths.onboardingPage1,
              width: 100,
              height: 100,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Добро пожаловать в Путеводитель',
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
              'Ищи новые локации и сохраняй самые любимые',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

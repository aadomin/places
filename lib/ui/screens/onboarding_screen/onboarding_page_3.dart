import 'package:flutter/material.dart';

import 'package:places/ui/res/ui_image_paths.dart';

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
            padding: const EdgeInsets.only(top: 70, bottom: 20),
            child: Image.asset(
              UiImagePaths.onboardingPage3,
              width: 100,
              height: 100,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Добавляй места, которые нашел сам',
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
              'Делись самыми интересными и помоги нам стать лучше!',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
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
                        child: Text('НА СТАРТ'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

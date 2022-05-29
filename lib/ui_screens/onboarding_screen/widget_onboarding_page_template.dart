import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/my_app_and_routes.dart';

import 'package:places/ui_commons/ui_strings.dart';

/// Страница "Добро пожаловать 3"
class WidgetOnboargindPageTemplate extends StatelessWidget {
  const WidgetOnboargindPageTemplate({
    required this.onboardingText1,
    required this.onboardingText2,
    required this.isFinalPage,
    required this.onboardingImgPath,
    Key? key,
  }) : super(key: key);

  final String onboardingText1;
  final String onboardingText2;
  final bool isFinalPage;
  final String onboardingImgPath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // изображение Онбординга 1
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SvgPicture.asset(
                    onboardingImgPath,
                    color: Theme.of(context).primaryColor,
                    width: 100,
                    height: 100,
                  ),
                ),

                // текст Онбординга 1
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    bottom: 24,
                    left: 25,
                    right: 25,
                  ),
                  child: Text(
                    onboardingText1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                ),

                // текст Онбординга 2
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    onboardingText2,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Theme.of(context).primaryColorLight),
                  ),
                ),

                // Плейсхолдер для выравнивания
                const SizedBox(height: 80),
              ],
            ),
          ),

          // кнопка 'На Старт!'

          Container(
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 60,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: isFinalPage == true
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, appRouteHome);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(UiStrings.onboardingGogogo),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

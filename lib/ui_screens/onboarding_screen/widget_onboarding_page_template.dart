import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:places/ui_commons/ui_strings.dart';

/// Страница "Добро пожаловать 3"
class WidgetOnboargindPageTemplate extends StatefulWidget {
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
  State<WidgetOnboargindPageTemplate> createState() =>
      _WidgetOnboargindPageTemplateState();
}

class _WidgetOnboargindPageTemplateState
    extends State<WidgetOnboargindPageTemplate>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 850,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _animationController,
                        child: SvgPicture.asset(
                          widget.onboardingImgPath,
                          color: Theme.of(context).primaryColor,
                        ),
                        builder: (context, child) {
                          return SizedBox(
                            height: _animationController.value * 100,
                            width: _animationController.value * 100,
                            child: Opacity(
                              opacity: _animationController.value,
                              child: child,
                            ),
                          );
                        },
                      ),
                    ),
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
                    widget.onboardingText1,
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
                    widget.onboardingText2,
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
                  child: widget.isFinalPage == true
                      ? ElevatedButton(
                          onPressed: () => onStartButtonPressed(context),
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

  void onStartButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }
}

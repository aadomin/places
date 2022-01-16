import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui/screens/onboarding_screen/widget_inner_content.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// Экран "Добро пожаловать" включающий в себя 3 подвкладки
class ScreenOnboarding extends StatefulWidget {
  const ScreenOnboarding({Key? key}) : super(key: key);
  @override
  _ScreenOnboardingState createState() => _ScreenOnboardingState();
}

class _ScreenOnboardingState extends State<ScreenOnboarding> {
  final PageController _pageController = PageController();

  double? currentPage = 1;

  @override
  void initState() {
    // ignore: avoid_single_cascade_in_expression_statements
    _pageController.addListener(() {
      currentPage = _pageController.page;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Row(
          children: [
            const Expanded(
              child: SizedBox.shrink(),
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            //
            // Кнопка "Пропустить"
            //
            Expanded(
              child: currentPage == 2
                  ? const SizedBox.shrink()
                  : TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, ROUTE_HOME);
                      },
                      style: TextButton.styleFrom(
                        primary: const Color(0xFF4CAF50),
                        //primary: Theme.of(context).primaryColorLight,
                      ),
                      child: const Align(
                        child: Text(
                          UiStrings.miss,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          //
          // Открытая вкладка
          //
          PageView(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {});
            },
            controller: _pageController,
            children: const [
              WidgetInnerContent(
                onboardingImgPath: UiImagePaths.onboardingPage1,
                onboardingText1: UiStrings.onboarding11,
                onboardingText2: UiStrings.onboarding12,
                isFinalPage: false,
              ),
              WidgetInnerContent(
                onboardingImgPath: UiImagePaths.onboardingPage2,
                onboardingText1: UiStrings.onboarding21,
                onboardingText2: UiStrings.onboarding22,
                isFinalPage: false,
              ),
              WidgetInnerContent(
                onboardingImgPath: UiImagePaths.onboardingPage3,
                onboardingText1: UiStrings.onboarding31,
                onboardingText2: UiStrings.onboarding32,
                isFinalPage: true,
              ),
            ],
          ),

          //
          // Индикатор выбранной (текущей) страницы
          //
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 80,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  UiImagePaths.points,
                  width: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

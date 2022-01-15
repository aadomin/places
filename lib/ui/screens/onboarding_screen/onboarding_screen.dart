import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui/screens/onboarding_screen/onboarding_page_1.dart';
import 'package:places/ui/screens/onboarding_screen/onboarding_page_2.dart';
import 'package:places/ui/screens/onboarding_screen/onboarding_page_3.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// Экран "Добро пожаловать" включающий в себя 3 подвкладки
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //
          // Открытая вкладка
          //
          SizedBox(
            height: 295,
            child: PageView(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {});
              },
              controller: _pageController,
              children: const [
                OnboardingPage1(),
                OnboardingPage2(),
                OnboardingPage3(),
              ],
            ),
          ),

          //
          // Индикатор выбранной (текущей) страницы
          //
          SizedBox(
            height: 30,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                UiImagePaths.points,
                width: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

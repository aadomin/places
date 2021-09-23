import 'package:flutter/material.dart';

import 'package:places/ui/my_app/ui_image_paths.dart';
import 'package:places/ui/my_app/routes.dart';
import 'package:places/ui/screens/onboarding_screen/onboarding_page_1.dart';
import 'package:places/ui/screens/onboarding_screen/onboarding_page_2.dart';
import 'package:places/ui/screens/onboarding_screen/onboarding_page_3.dart';

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
    _pageController
      ..addListener(() {
        currentPage = _pageController.page;
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title: Row(
          children: [
            const Expanded(
              child: SizedBox.shrink(),
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Expanded(
              child: currentPage == 2
                  ? const SizedBox.shrink()
                  : TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, ROUTE_HOME);
                      },
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColorLight,
                      ),
                      child: const Align(
                        child: Text(
                          'Пропустить',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          PageView(
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(120),
              child: Image.asset(
                UiImagePaths.points,
                width: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}

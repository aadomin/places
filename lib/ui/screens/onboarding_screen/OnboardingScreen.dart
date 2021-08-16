import "package:flutter/material.dart";

import 'OnboardingPage1.dart';
import 'OnboardingPage2.dart';
import 'OnboardingPage3.dart';

import 'package:places/ui/res/UiImagePaths.dart';

import 'package:places/ui/my_app/routes.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  double currentPage = 1;

  @override
  void initState() {
    _pageController
      ..addListener(() {
        setState(() {
          currentPage = _pageController.page;
          print(currentPage);
        });
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
            Expanded(
              flex: 1,
              child: SizedBox.shrink(),
            ),
            Expanded(
              flex: 1,
              child: SizedBox.shrink(),
            ),
            Expanded(
              flex: 1,
              child: currentPage == 2
                  ? SizedBox.shrink()
                  : TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, ROUTE_HOME);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Пропустить',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColorLight,
                      ),
                    ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: PageView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              reverse: false,
              onPageChanged: (value) {
                setState(() {});
              },
              controller: _pageController,
              children: [
                OnboardingPage1(pageController: _pageController),
                OnboardingPage2(pageController: _pageController),
                OnboardingPage3(pageController: _pageController),
              ],
            ),
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

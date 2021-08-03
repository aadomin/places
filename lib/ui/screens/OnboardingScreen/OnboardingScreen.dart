import "package:flutter/material.dart";

import 'OnboardingPage1.dart';
import 'OnboardingPage2.dart';
import 'OnboardingPage3.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

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
              child: _pageController.initialPage ==1 
                  ? SizedBox.shrink()
                  : TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
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
      body: Container(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:places/ui/res/ui_image_paths.dart';

import 'package:places/ui/screens/splash_screen/splash_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    MySplashModel.initAppAndThenChangeScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4CAF50),
              Color(0xffFCDD3D),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            UiImagePaths.logo,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}

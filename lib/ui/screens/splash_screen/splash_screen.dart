import 'package:flutter/material.dart';

import 'package:places/ui/my_app/ui_image_paths.dart';
import 'package:places/ui/screens/splash_screen/splash_screen_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashScreenModel.initAppAndThenChangeScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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

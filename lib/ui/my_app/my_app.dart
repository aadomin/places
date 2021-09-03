import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/my_app/themes.dart';
import 'package:places/ui/my_app/routes.dart';
import 'package:places/ui/my_app/platform_detector.dart';
import 'package:places/ui/my_app/my_app_model.dart';
import 'package:places/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:places/ui/screens/filter_screen/filters_screen.dart';
import 'package:places/ui/screens/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/screens/select_category_screen/select_category_screen.dart';
import 'package:places/ui/screens/sight_search_screen/sight_search_screen.dart';
import 'package:places/ui/screens/main_screen/main_screen.dart';
import 'package:places/ui/screens/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey, Flutter!',
      theme: context.watch<MyThemeModel>().isDarkTheme ? darkTheme : lightTheme,
      initialRoute: ROUTE_SPLASH,
      debugShowCheckedModeBanner: false,
      routes: {
        ROUTE_HOME: (context) => const AllMainScreens(),
        ROUTE_FILTER: (context) => const FiltersScreen(),
        ROUTE_ADD: (context) => const AddSightScreen(),
        ROUTE_SELECT_CATEGORY: (context) => const SelectCategory(),
        ROUTE_SEARCH: (context) => SightSearchScreen(),
        ROUTE_ONBOARDING: (context) => const OnboardingScreen(),
        ROUTE_SPLASH: (context) => const SplashScreen(),
      },
    );
  }
}

var platformDetector = PlatformDetector();

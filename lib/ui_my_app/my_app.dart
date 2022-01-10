import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_my_app/themes.dart';
import 'package:places/ui_my_app/routes.dart';
import 'package:places/ui_my_app/platform_detector.dart';
import 'package:places/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:places/ui/screens/filter_screen/filters_screen.dart';
import 'package:places/ui/screens/add_place_screen/screen_add_place.dart';
import 'package:places/ui/screens/select_category_screen/select_category_screen.dart';
import 'package:places/ui/screens/place_search_screen/place_search_screen.dart';
import 'package:places/ui/screens/main_screen/main_screen.dart';
import 'package:places/ui/screens/splash_screen/splash_screen.dart';

import 'package:places/ui_interactors/settings_interactor.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey, Flutter!',
      theme: context.watch<SettingsInteractor>().isDarkThemeOn
          ? darkTheme
          : lightTheme,
      initialRoute: ROUTE_SPLASH,
      debugShowCheckedModeBanner: false,
      routes: {
        ROUTE_HOME: (context) => const AllMainScreens(),
        ROUTE_FILTER: (context) => const FiltersScreen(),
        ROUTE_ADD: (context) => const ScreenAddPlace(),
        ROUTE_SELECT_CATEGORY: (context) => const SelectCategory(),
        ROUTE_SEARCH: (context) => PlaceSearchScreen(),
        ROUTE_ONBOARDING: (context) => const OnboardingScreen(),
        ROUTE_SPLASH: (context) => const SplashScreen(),
      },
    );
  }
}

PlatformDetector platformDetector = PlatformDetector();

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;

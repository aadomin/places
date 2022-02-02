import 'package:flutter/material.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_route.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category_route.dart';
import 'package:provider/provider.dart';
import 'package:places/ui_commons/themes.dart';
import 'package:places/ui_screens/onboarding_screen/screen_onboarding.dart';
import 'package:places/ui_screens/filter_screen/screen_filter.dart';
import 'package:places/ui_screens/place_search_screen/place_search_screen.dart';
import 'package:places/ui_screens/main_screen/screen_all_main.dart';
import 'package:places/ui_screens/splash_screen/screen_splash.dart';

import 'package:places/ui_interactors/settings_interactor.dart';

const String ROUTE_HOME = '/';
const String ROUTE_FILTER = '/filter';
const String ROUTE_ADD = '/add';
const String ROUTE_SELECT_CATEGORY = '/select_category';
const String ROUTE_SEARCH = '/search';
const String ROUTE_ONBOARDING = '/onboarding';
const String ROUTE_SPLASH = '/splash';

///
/// Класс содержит маршруты в приложении и виджет MaterialApp
///
class MyAppAndRoutes extends StatelessWidget {
  const MyAppAndRoutes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey, Flutter!',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<SettingsInteractor>().isDarkThemeOn
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: ROUTE_SPLASH,
      debugShowCheckedModeBanner: false,
      routes: {
        ROUTE_HOME: (context) => const ScreenAllMain(),
        ROUTE_FILTER: (context) => const ScreenFilter(),
        ROUTE_ADD: (context) => const ScreenAddPlaceRoute(),
        ROUTE_SELECT_CATEGORY: (context) =>
            const ScreenSelectionCategoryRoute(),
        ROUTE_SEARCH: (context) => PlaceSearchScreen(),
        ROUTE_ONBOARDING: (context) => const ScreenOnboarding(),
        ROUTE_SPLASH: (context) => const ScreenSplash(),
      },
    );
  }
}

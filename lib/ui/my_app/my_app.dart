import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/screens/onboarding_screen/OnboardingScreen.dart';
import '../screens/sight_details_screen/sight_details_screen.dart';
import '../screens/filter_screen/filters_screen.dart';
import '../screens/add_sight_screen/add_sight_screen.dart';
import '../screens/select_category_screen/select_category_screen.dart';
import '../screens/sight_search_screen/sight_search_screen.dart';
import '../screens/main_screen/main_screen.dart';

import '../../data/mocks.dart';

import 'themes.dart';
import 'routes.dart';
import 'my_app_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey, Flutter!',
      theme: context.watch<MyThemeModel>().isDarkTheme ? darkTheme : lightTheme,
      //
      initialRoute: ROUTE_ONBOARDING,
      debugShowCheckedModeBanner: false,
      routes: {
        ROUTE_HOME: (BuildContext context) => AllMainScreens(),
        ROUTE_DETAILS: (BuildContext context) => SightDetailsScreen(mocks[0]),
        ROUTE_FILTER: (BuildContext context) => FiltersScreen(),
        ROUTE_ADD: (BuildContext context) => AddSightScreen(),
        ROUTE_SELECT_CATEGORY: (BuildContext context) => SelectCategory(),
        ROUTE_SEARCH: (BuildContext context) => SightSearchScreen(),
        ROUTE_ONBOARDING: (BuildContext context) => OnboardingScreen(),
      },
    );
  }
}

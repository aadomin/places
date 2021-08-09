import 'package:flutter/material.dart';
import 'package:places/ui/models/my_places_model.dart';
import 'package:places/ui/models/ui_search_model.dart';
import 'package:places/ui/screens/OnboardingScreen/OnboardingScreen.dart';
import 'package:provider/provider.dart';
import 'ui/screens/1_sight_list_screen.dart';
import 'ui/screens/2_map_screen.dart';
import 'ui/screens/3_0_visiting_screen.dart';
import 'ui/screens/4_settings_screen.dart';
import 'ui/screens/sight_details_screen.dart';
import 'ui/screens/filters_screen.dart';
import 'ui/screens/add_sight_screen.dart';
import 'ui/screens/select_caterory_screen.dart';
import 'ui/screens/sight_search_screen.dart';
import 'mocks.dart';

import 'ui/res/themes.dart';
import 'ui/models/ui_theme_model.dart';
import 'ui/models/ui_filter_model.dart';
import 'ui/models/ui_categories_model.dart';
import 'ui/models/my_places_model.dart';
import 'ui/models/ui_search_model.dart';
import 'routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyThemeModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyFilterModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyCategoriesModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyPlacesModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MySearchModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey, Flutter!',
      theme: context.watch<MyThemeModel>().isDarkTheme ? darkTheme : lightTheme,
      //
      initialRoute: ROUTE_ONBOARDING,
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

class AllMainScreens extends StatefulWidget {
  @override
  _AllMainScreensState createState() => new _AllMainScreensState();
}

class _AllMainScreensState extends State<AllMainScreens> {
  int _page = 0;
  PageController _c;
  @override
  void initState() {
    _c = new PageController(
      initialPage: _page,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          this._c.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Список мест',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
      body: PageView(
        controller: _c,
        onPageChanged: (newPage) {
          setState(() {
            this._page = newPage;
          });
        },
        children: [
          Center(child: SightListScreen()),
          Center(child: MapsScreen()),
          Center(child: VisitingScreen()),
          Center(child: SettingsScreen()),
        ],
      ),
    );
  }
}

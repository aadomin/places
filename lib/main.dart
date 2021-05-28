import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/screens/sight_list_screen.dart';
import 'ui/screens/sight_details_screen.dart';
import 'ui/screens/visiting_screen.dart';
import 'ui/screens/settings_screen.dart';
import 'ui/screens/filters_screen.dart';
import 'mocks.dart';

import 'ui/res/themes.dart';
import 'ui/models/ui_theme_model.dart';

//Provider добавил для динамической смены тем. Через vanilla ну никак не получалось.
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyThemeModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey, Flutter!',
      theme: context.watch<MyThemeModel>().isDarkTheme ? darkTheme : lightTheme,
      //
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => AllMainScreens(),
        '/details': (BuildContext context) => SightDetailsScreen(mocks[0]),
        '/filter': (BuildContext context) => FiltersScreen()
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
          Center(
              child: Center(
            child: Text('Карта'),
          )), //здесь временно
          Center(child: VisitingScreen()),
          Center(child: SettingsScreen()),
        ],
      ),
    );
  }
}

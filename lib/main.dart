import 'package:flutter/material.dart';
import 'ui/screen/sight_list_screen.dart';
import 'ui/screen/sight_details_screen.dart';
import 'mocks.dart';
import 'ui/screen/visiting_screen.dart';
import 'ui/screen/settings_screen.dart';
import 'ui/res/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey, Flutter!',
      theme: lightTheme,
      home: //VisitingScreen(),
          // временное переключение между экранами
          // SightDetailsScreen(mocks[0]),
          // SightListScreen(),
          BottomBarExample(),
    );
  }
}

class BottomBarExample extends StatefulWidget {
  @override
  _BottomBarExampleState createState() => new _BottomBarExampleState();
}

class _BottomBarExampleState extends State<BottomBarExample> {
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
            label: '1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '4',
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
          Center(child: SightDetailsScreen(mocks[0])),
          Center(child: VisitingScreen()),
          Center(child: SettingsScreen()),
        ],
      ),
    );
  }
}

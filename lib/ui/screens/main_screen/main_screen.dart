import 'package:flutter/material.dart';
import 'package:places/ui/screens/main_1_places_list/screen_main1_places_route.dart';
import 'package:places/ui/screens/main_2_map/screen_main_2_map.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/screen_main3_favorite_and_visited_route.dart';
import 'package:places/ui/screens/main_4_settings/screen_main_4_settings.dart';

/// ГЛАВНЫЙ ЭКРАН.
/// Состоит из 4х частей - переход к ним
/// осуществляется через нажатие на кнопкам в BottomNavigationBar.
///
class AllMainScreens extends StatefulWidget {
  const AllMainScreens({Key? key}) : super(key: key);
  @override
  _AllMainScreensState createState() => _AllMainScreensState();
}

class _AllMainScreensState extends State<AllMainScreens> {
  List<Widget> widgetsPageList = const [
    SafeArea(child: Center(child: ScreenMain1PlacesRoute())),
    Center(child: ScreenMain2Map()),
    Center(child: ScreenMain3FavoriteAndVisitedRoute()),
    Center(child: ScreenMain4Settings()),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        child: widgetsPageList[currentPage],
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items: const [
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
    );
  }

  void onTap(int value) {
    setState(() {
      currentPage = value;
    });
  }
}

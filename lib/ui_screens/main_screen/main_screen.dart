import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_route.dart';
import 'package:places/ui_screens/main_2_map/screen_main_2_map.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_favorite_and_visited_route.dart';
import 'package:places/ui_screens/main_4_settings/screen_main_4_settings.dart';

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
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentPage == 0
                  ? UiImagePaths.places_filled
                  : UiImagePaths.places,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: 'Список мест',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentPage == 1 ? UiImagePaths.maps_filled : UiImagePaths.maps,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentPage == 2 ? UiImagePaths.heart_filled : UiImagePaths.heart,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentPage == 3
                  ? UiImagePaths.settings_filled
                  : UiImagePaths.settings,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
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

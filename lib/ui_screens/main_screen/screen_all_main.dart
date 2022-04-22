import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_di.dart';
import 'package:places/ui_screens/main_2_map/screen_main_2_map.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit_di.dart';
import 'package:places/ui_screens/main_4_settings/screen_main_4_settings_di.dart';

/// ГЛАВНЫЙ ЭКРАН.
/// Состоит из 4х частей - переход к ним
/// осуществляется через нажатие на кнопкам в BottomNavigationBar.
///
class ScreenAllMain extends StatefulWidget {
  const ScreenAllMain({Key? key}) : super(key: key);
  @override
  _ScreenAllMainState createState() => _ScreenAllMainState();
}

class _ScreenAllMainState extends State<ScreenAllMain> {
  int currentPage = 0;
  late List<Widget> _widgetsPageList;

  @override
  void initState() {
    super.initState();
    _widgetsPageList = [
      // ТУТВОПРОС
      SafeArea(
        child: Center(
          child: createScreenMain1Places(context),
        ),
      ),
      const Center(
        child: ScreenMain2Map(),
      ),
      const Center(
        child: ScreenMain3FavoriteAndVisitedDI(),
      ),
      Center(
        child: createScreenMain4Settings(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        child: _widgetsPageList[currentPage],
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
            label: UiStrings.listOfPlaces,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentPage == 1 ? UiImagePaths.maps_filled : UiImagePaths.maps,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: UiStrings.maps,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentPage == 2 ? UiImagePaths.heart_filled : UiImagePaths.heart,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: UiStrings.favorites,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              currentPage == 3
                  ? UiImagePaths.settings_filled
                  : UiImagePaths.settings,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: UiStrings.settings,
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/my_app_and_routes.dart';
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
  late List<Widget Function()> _wPageList;
  int numOfCurrentPage = 0;
  bool firstRunOfApp = false;

  @override
  void initState() {
    // ТУТВОПРОС
    super.initState();

    _wPageList = [
      // ТУТВОПРОС как это сделать лучше
      () => SafeArea(
            child: Center(
              child: createScreenMain1Places(context),
            ),
          ),
      () => const Center(
            child: ScreenMain2Map(),
          ),
      () => const Center(
            child: ScreenMain3FavoriteAndVisitedDI(),
          ),
      () => Center(
            child: createScreenMain4Settings(context),
          ),
    ];
  }

  @override
  void didChangeDependencies() {
    // ТУТВОПРОС
    super.didChangeDependencies();
    if (firstRunOfApp) {
      Navigator.of(context).pushNamed(appRouteOnboarding);
      firstRunOfApp = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: _wPageList[numOfCurrentPage].call(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: numOfCurrentPage,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              numOfCurrentPage == 0
                  ? UiImagePaths.placesFilled
                  : UiImagePaths.places,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: UiStrings.listOfPlaces,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              numOfCurrentPage == 1
                  ? UiImagePaths.mapsFilled
                  : UiImagePaths.maps,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: UiStrings.maps,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              numOfCurrentPage == 2
                  ? UiImagePaths.heartFilled
                  : UiImagePaths.heart,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: UiStrings.favorites,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              numOfCurrentPage == 3
                  ? UiImagePaths.settingsFilled
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
      numOfCurrentPage = value;
    });
  }
}

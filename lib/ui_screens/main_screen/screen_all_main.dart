import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_di.dart';
import 'package:places/ui_screens/main_2_map/screen_main_2_map.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit_di.dart';
import 'package:places/ui_screens/main_4_settings/screen_main_4_settings_di.dart';
import 'package:places/ui_screens/main_screen/screen_all_main_vm.dart';

///
/// ГЛАВНЫЙ ЭКРАН.
/// Состоит из 4х частей - переход к ним
/// осуществляется через нажатие на кнопкам в BottomNavigationBar
///
class ScreenAllMain extends StatefulWidget {
  const ScreenAllMain({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final ScreenAllMainVM viewModel;

  @override
  State<ScreenAllMain> createState() => _ScreenAllMainState();
}

class _ScreenAllMainState extends State<ScreenAllMain> {
  ScreenAllMainVM get ___vm => widget.viewModel;

  @override
  void initState() {
    widget.viewModel.addListener(_vmListener);
    widget.viewModel.initVM();
    super.initState();
  }

  void _vmListener() => setState(() {});

  @override
  void dispose() {
    widget.viewModel.disposeVM();
    widget.viewModel.removeListener(_vmListener);
    super.dispose();
  }

  //

  final List<Widget Function()> _wPageList = [
    () => const SafeArea(
          child: Center(
            child: ScreenMain1PlacesDI(),
          ),
        ),
    () => const Center(
          child: ScreenMain2Map(),
        ),
    () => const Center(
          child: ScreenMain3FavAndVisitDI(),
        ),
    () => const Center(
          child: ScreenMain4SettingsDI(),
        ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: _wPageList[___vm.currentPage].call(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ___vm.currentPage,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: ___vm.onTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ___vm.currentPage == 0
                  ? UiImagePaths.placesFilled
                  : UiImagePaths.places,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: UiStrings.listOfPlaces,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ___vm.currentPage == 1
                  ? UiImagePaths.mapsFilled
                  : UiImagePaths.maps,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: UiStrings.maps,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ___vm.currentPage == 2
                  ? UiImagePaths.heartFilled
                  : UiImagePaths.heart,
              color: Theme.of(context).primaryColor,
              height: 20,
            ),
            label: UiStrings.favorites,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ___vm.currentPage == 3
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
}

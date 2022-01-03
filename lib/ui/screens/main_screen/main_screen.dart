import 'package:flutter/material.dart';

import 'package:places/ui/screens/main_1_places_list/screen_main1_places_router.dart';
import 'package:places/ui/screens/main_2_map/screen_main_2_map.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/screen_main3_wished_seen.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/screen_main3_wished_seen_router.dart';
import 'package:places/ui/screens/main_4_settings/screen_main_4_settings.dart';

class AllMainScreens extends StatefulWidget {
  const AllMainScreens({Key? key}) : super(key: key);
  @override
  _AllMainScreensState createState() => _AllMainScreensState();
}

class _AllMainScreensState extends State<AllMainScreens> {
  int _page = 0;
  late PageController _c;
  @override
  void initState() {
    _c = PageController(
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
          _c.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
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
      body: PageView(
        controller: _c,
        onPageChanged: (newPage) {
          setState(() {
            _page = newPage;
          });
        },
        children: const [
          Center(child: ScreenMain1PlacesRouter()),
          Center(child: ScreenMain2Map()),
          Center(child: ScreenMain3WishedSeenRouter()),
          Center(child: ScreenMain4Settings()),
        ],
      ),
    );
  }
}

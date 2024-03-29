import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit_vm.dart';

import 'package:places/ui_screens/main_3_wished_and_seen/widget_tab_favorite.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/widget_tab_visited.dart';
import 'package:places/ui_widgets_commons/widget_my_header.dart';

/// Экран 3. Список избранных и посещенных мест.
/// Третий из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
///
class ScreenMain3FavAndVisit extends StatefulWidget {
  const ScreenMain3FavAndVisit({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final ScreenMain3FavAndVisitVM viewModel;

  @override
  _ScreenMain3FavAndVisitState createState() => _ScreenMain3FavAndVisitState();
}

class _ScreenMain3FavAndVisitState extends State<ScreenMain3FavAndVisit>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  ScreenMain3FavAndVisitVM get ___vm => widget.viewModel;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(
        milliseconds: 850,
      ),
    );
    super.initState();
    ___vm
      ..initVM()
      ..addListener(_vmListener);
  }

  void _vmListener() => setState(() {});

  @override
  void dispose() {
    ___vm
      ..removeListener(_vmListener)
      ..disposeVM();
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).canvasColor,
              elevation: 0,
              title: const WidgetMyHeader(header: UiStrings.favorites),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                //grey background
                color: Theme.of(context).disabledColor,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Theme.of(context).primaryColorLight,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Theme.of(context).canvasColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).selectedRowColor,
                ),
                tabs: const [
                  //
                  // Хочу посетить
                  //
                  Tab(
                    child: Align(
                      child: Text(
                        UiStrings.wantToSee,
                      ),
                    ),
                  ),
                  //
                  // Посетил
                  //
                  Tab(
                    child: Align(
                      child: Text(
                        UiStrings.haveSeen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Tab(
            child: WidgetTabFavorite(
              favoritePlaces: ___vm.favoritePlaces,
              isLoading: ___vm.isLoading,
              onRemoveFromFavorites: ___vm.onRemoveFromFavorites,
            ),
          ),
          Tab(
            child: WidgetTabVisited(
              visitedPlaces: ___vm.visitedPlaces,
              isLoading: ___vm.isLoading,
              onRemoveFromVisited: ___vm.onRemoveFromVisited,
            ),
          ),
        ],
      ),
    );
  }
}

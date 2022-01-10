import 'package:flutter/material.dart';
import 'package:places/domain_models/place.dart';

import 'package:places/ui/screens/main_3_wished_and_seen/widget_tab_favorite.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/widget_tab_visited.dart';
import 'package:places/ui_widgets/headers.dart';

/// Экран 3. Список избранных и посещенных мест.
/// Третий из четырех главных экранов, доступных по нажатию на 
/// BottomNavigationBar.
/// Данный класс описывает ГЛАВНОЕ состояние экрана
/// 
class ScreenMain3FavoriteAndVisited extends StatefulWidget {
  const ScreenMain3FavoriteAndVisited({
    required this.visitedPlaces,
    required this.favoritePlaces,
    Key? key,
  }) : super(key: key);

  final List<Place> visitedPlaces;
  final List<Place> favoritePlaces;

  @override
  _ScreenMain3FavoriteAndVisitedState createState() =>
      _ScreenMain3FavoriteAndVisitedState();
}

class _ScreenMain3FavoriteAndVisitedState
    extends State<ScreenMain3FavoriteAndVisited>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  //double _indicatorPosition = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  // void _onChangeTab() {
  //   setState(() {
  //     _indicatorPosition = _tabController.index.toDouble();
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    _tabController
      // ..removeListener(_onChangeTab)
      .dispose();
  }

  @override
  Widget build(BuildContext context) {

    const String _header = 'Избранное';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140),
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).canvasColor,
                elevation: 0,
                title: const WidgetMyHeader(header: _header),
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
                  unselectedLabelColor: Theme.of(context).primaryColorLight,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Theme.of(context).canvasColor,
                  // labelStyle: TextStyle(
                  //   height: 15,
                  // ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).selectedRowColor,
                  ),
                  tabs: const [
                    Tab(
                      child: Align(
                        child: Text(
                          'Хочу посетить',
                        ),
                      ),
                    ),
                    Tab(
                      child: Align(
                        child: Text(
                          'Посетил',
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
          //controller: _tabController,
          children: [
            Tab(
              child: WidgetTabFavorite(
                favoritePlaces: widget.favoritePlaces,
              ),
            ),
            Tab(
              child: WidgetTabVisited(
                visitedPlaces: widget.visitedPlaces,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:places/domain_models/place.dart';

import 'package:places/ui/screens/main_3_wished_and_seen/widget_tab_favorite.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/widget_tab_visited.dart';
import 'package:places/ui_widgets/headers.dart';

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

  double _indicatorPosition = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _onChangeTab() {
    setState(() {
      _indicatorPosition = _tabController.index.toDouble();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController
      ..removeListener(_onChangeTab)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _widthOfWindows = MediaQuery.of(context).size.width;
    const double _uiDefaultPadding = 16;
    const double _uiDefaultButtonHeight = 55;

    const String _header = 'Избранное';

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            children: [
              const WidgetMyHeader(header: _header),
              Stack(
                children: [
                  Container(
                    // Tab Indicator 1 of 3 - grey background
                    width: double.infinity,
                    height: _uiDefaultButtonHeight,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          _uiDefaultButtonHeight / 2,
                        ),
                      ),
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  SizedBox(
                    height: _uiDefaultButtonHeight,
                    child: Row(
                      children: [
                        // Tab Indicator 2 of 3- margin for animation
                        SizedBox(
                          width:
                              ((_widthOfWindows - 2 * _uiDefaultPadding) / 2) *
                                  _indicatorPosition,
                        ),
                        // Tab Indicator 3 of 3 - colorful indicator
                        SizedBox(
                          width: (_widthOfWindows - 2 * _uiDefaultPadding) / 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  _uiDefaultButtonHeight / 2,
                                ),
                              ),
                              color: Theme.of(context).selectedRowColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _tabController.animateTo(0);
                            setState(() {
                              _indicatorPosition = 0;
                            });
                          },
                          child: Container(
                            height: _uiDefaultButtonHeight,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(_uiDefaultPadding),
                            child: Text(
                              'Хочу посетить',
                              style: TextStyle(
                                color: _indicatorPosition == 0
                                    ? Theme.of(context).canvasColor
                                    : Theme.of(context).primaryColorLight,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _tabController.animateTo(1);
                            setState(() {
                              _indicatorPosition = 1;
                            });
                          },
                          child: Container(
                            height: _uiDefaultButtonHeight,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Посетил',
                              style: TextStyle(
                                color: _indicatorPosition == 0
                                    ? Theme.of(context).primaryColorLight
                                    : Theme.of(context).canvasColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: TabBarView(
          controller: _tabController,
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

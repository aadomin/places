import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/app_actions.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/redux_store.dart';
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
    super.initState();
    ___vm
      ..initVM()
      ..addListener(_vmListener);
    _tabController = TabController(length: 2, vsync: this);
    store.dispatch(LoadDataAction());
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
    const String _header = UiStrings.favorites;

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
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).selectedRowColor,
                  ),
                  tabs: const [
                    // Хочу посетить
                    Tab(
                      child: Align(
                        child: Text(
                          UiStrings.wantToSee,
                        ),
                      ),
                    ),
                    // Посетил
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
          children: [
            Tab(
              child: StoreConnector<ReduxStore, List<Place>>(
                  converter: (store) => store.state.favoritePlaces,
                  builder: (context, ___favoritePlaces) {
                    return StoreConnector<ReduxStore, void Function(int)>(
                      converter: (store) {
                        return (id) =>
                            store.dispatch(RemoveFromFavoritesAction(id));
                      },
                      builder: (context, ___onRemoveFromFavorites) {
                        return WidgetTabFavorite(
                          favoritePlaces: ___favoritePlaces,
                          removeFromFavorites: ___onRemoveFromFavorites,
                        );
                      },
                    );
                  }),
            ),
            Tab(
              child: WidgetTabVisited(
                visitedPlaces: ___vm.visitedPlaces,
                removeFromVisited: ___vm.removeFromVisited,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

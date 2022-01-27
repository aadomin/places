import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/main.dart';
import 'package:places/ui_blocs/visited_and_favorite_screen_state.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_favorite_and_visited.dart';
import 'package:places/ui_blocs/visited_and_favorite_screen_cubit.dart';
import 'package:places/ui_widgets_commons/widget_network_error.dart';

/// Экран 3. Список избранных и посещенных мест.
/// Третий из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
/// Данный класс описывает разные состояния экрана (в т.ч. ошибка, загрузка)
///
class ScreenMain3FavoriteAndVisitedRoute extends StatefulWidget {
  const ScreenMain3FavoriteAndVisitedRoute({Key? key}) : super(key: key);

  @override
  _ScreenMain3FavoriteAndVisitedRouteState createState() =>
      _ScreenMain3FavoriteAndVisitedRouteState();
}

class _ScreenMain3FavoriteAndVisitedRouteState
    extends State<ScreenMain3FavoriteAndVisitedRoute> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VisitedAndFavoriteScreenCubit(
        VisitedAndFavoriteScreenState(
          visitedPlaces: [Place(id: 0)],
          favoritePlaces: [Place(id: 0)],
        ),
      )..init(),
      child: BlocBuilder<VisitedAndFavoriteScreenCubit,
          VisitedAndFavoriteScreenState>(
        builder: (context, state) {
          if (placeInteractor.isRequestDoneWithError) {
            return const Scaffold(
              body: WidgetNetworkError(),
            );
          }
          return ScreenMain3FavoriteAndVisited(
            visitedPlaces: state.visitedPlaces,
            favoritePlaces: state.favoritePlaces,
          );
        },
      ),
    );
  }
}

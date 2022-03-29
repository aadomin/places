import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_narrow.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_wide.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/place.dart';

/// Экран 1. Список мест.
/// Первый из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
/// Данный класс описывает разные состояния экрана (в т.ч. ошибка, загрузка)
///
class ScreenMain1PlacesRoute extends StatefulWidget {
  const ScreenMain1PlacesRoute({Key? key}) : super(key: key);

  @override
  _ScreenMain1PlacesRouteState createState() => _ScreenMain1PlacesRouteState();
}

class _ScreenMain1PlacesRouteState extends State<ScreenMain1PlacesRoute> {
  /// ширина экрана при которой появляются 2 столбца
  static const criticalWidth = 800.0;

  @override
  Widget build(BuildContext context) {
    final List<Place> filteredPlaces =
        context.watch<PlacesInteractor>().getFilteredPlaces;

    if (filteredPlaces.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    // TODO(me): error
    // if (context.watch<PlacesInteractor>().isRequestDoneWithError) {
    //   return const Scaffold(
    //     body: WidgetNetworkError(),
    //   );
    // }

    if (MediaQuery.of(context).size.width <= criticalWidth) {
      return ScreenMain1PlacesNarrow(
        filteredPlacesSnapshot: filteredPlaces,
      );
    } else {
      return ScreenMain1PlacesWide(
        filteredPlacesSnapshot: filteredPlaces,
        criticalWidth: criticalWidth,
      );
    }
  }
}

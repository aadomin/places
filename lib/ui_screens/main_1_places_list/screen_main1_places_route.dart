import 'package:flutter/material.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_narrow.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_route_vm.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_wide.dart';
import 'package:places/domain_models/place.dart';

/// Экран 1. Список мест.
/// Первый из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
/// Данный класс описывает разные состояния экрана (в т.ч. ошибка, загрузка)
///
class ScreenMain1PlacesRoute extends StatefulWidget {
  const ScreenMain1PlacesRoute({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final ScreenMain1PlacesRouteVM viewModel;

  @override
  _ScreenMain1PlacesRouteState createState() => _ScreenMain1PlacesRouteState();
}

class _ScreenMain1PlacesRouteState extends State<ScreenMain1PlacesRoute> {
  /// ширина экрана при которой появляются 2 столбца
  static const criticalWidth = 800.0;

  ScreenMain1PlacesRouteVM get __viewModel => widget.viewModel;

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

  @override
  Widget build(BuildContext context) {
    // ТУТВОПРОС нужен ли тут final
    // ТУТВОПРОС ради одного
    final List<Place> filteredPlaces = __viewModel.filteredPlaces;

    // ТУТВОПРОС
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

    // ТУТВОПРОС
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

import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_entities/place.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details_di.dart';

/// VM экрана Главный экран 1 - список мест
class ScreenMain1PlacesVM with ChangeNotifier {
  ScreenMain1PlacesVM({
    required this.context,
    required this.placesInteractor,
  });

  BuildContext context;
  final PlacesInteractor placesInteractor;

  void initVM() {
    placesInteractor.addListener(_placesInteractorListener);
    _loadFilteredPlaces(showLoadingIndicator: true);
  }

  void _placesInteractorListener() {
    _loadFilteredPlaces(showLoadingIndicator: false);
    notifyListeners();
  }

  void disposeVM() {
    placesInteractor.removeListener(_placesInteractorListener);
  }

  //

  WidgetStatus state = WidgetStatus.isLoading;

  List<Place> _filteredPlaces = [];

  List<Place> get filteredPlaces {
    return _filteredPlaces;
  }

  Future<void> _loadFilteredPlaces({required bool showLoadingIndicator}) async {
    if (showLoadingIndicator) {
      state = WidgetStatus.isLoading;
      notifyListeners();
    }
    try {
      _filteredPlaces = await placesInteractor.filteredWithFilterPlaces;
      if (filteredPlaces.isEmpty) {
        state = WidgetStatus.isEmpty;
      } else {
        state = WidgetStatus.isReady;
      }
      notifyListeners();
      return;
    } on Object catch (e) {
      debugPrint('$e'); // TODO(me): error log
      state = WidgetStatus.isError;
      notifyListeners();
      return;
    }
  }

  //

  void onRemoveFromFavorites(int id) =>
      placesInteractor.removeFromFavorites(id);

  void onAddToFavorites(int id) => placesInteractor.addToFavorites(id);

  void onTapOnPlace(BuildContext context, int id) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => createScreenPlaceDetails(
        context: context,
        placeId: id,
      ),
    );
  }

  Future<void> onNewPlace() async {
    //ТУТВОПРОС нормально ли сделано? нужны ли такие проверки?
    dynamic isAdded = await Navigator.pushNamed(context, appRouteAdd);
    if (isAdded is! bool?) throw Exception();
    
    if (isAdded ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(UiStrings.newPlaceCreated)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(UiStrings.error)),
      );
    }
  }
}

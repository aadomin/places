import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_commons/enums.dart';
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
    loadFilteredPlaces();
    placesInteractor.addListener(_placesInteractorListener);
  }

  void _placesInteractorListener() {
    loadFilteredPlaces();
    notifyListeners();
  }

  void disposeVM() {
    placesInteractor.removeListener(_placesInteractorListener);
  }

  //

  VMStatus status = VMStatus.isLoading;

  List<Place> _filteredPlaces = [];

  List<Place> get filteredPlaces {
    return _filteredPlaces;
  }

  Future<void> loadFilteredPlaces() async {
    status = VMStatus.isLoading;

    notifyListeners();
    try {
      _filteredPlaces = await placesInteractor.filteredWithFilterPlaces;
      if (filteredPlaces.isEmpty) {
        status = VMStatus.isEmpty;
      } else {
        status = VMStatus.isReady;
      }
      notifyListeners();
      return;
    } on Object catch (e) {
      print('$e'); // TODO(me): error log
      status = VMStatus.isError;
      notifyListeners();
      return;
    }
  }

  //

  void onRemoveFromFavorites(int id) =>
      placesInteractor.removeFromFavorites(id);

  void onAddToFavorites(int id) => placesInteractor.addToFavorites(id);

  void onRemoveAtAll(int id) => placesInteractor.removeAtAll(id);

  // TODO(me): 3
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
}

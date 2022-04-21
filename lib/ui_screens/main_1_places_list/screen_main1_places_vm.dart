import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/place.dart';

class ScreenMain1PlacesVM with ChangeNotifier {
  ScreenMain1PlacesVM({
    required this.context,
    required this.placesInteractor,
  });

  BuildContext context;
  final PlacesInteractor placesInteractor;

  void initVM() {
    placesInteractor.addListener(_placesInteractorListener);
  }

  void _placesInteractorListener() => notifyListeners();

  void disposeVM() {
    placesInteractor.removeListener(_placesInteractorListener);
  }

  //

  List<Place> get filteredPlaces => placesInteractor.getFilteredPlaces;

  void onRemoveFromFavorites(int id) =>
      placesInteractor.removeFromFavorites(id);

  void onAddToFavorites(int id) => placesInteractor.addToFavorites(id);

  void onRemoveAtAll(int id) => placesInteractor.removeAtAll(id);
}

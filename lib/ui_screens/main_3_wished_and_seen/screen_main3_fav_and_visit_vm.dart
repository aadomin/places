import 'package:flutter/material.dart';
import 'package:places/domain_interactors/places_interactor.dart';
import 'package:places/domain_entities/place.dart';

class ScreenMain3FavAndVisitVM with ChangeNotifier {
  ScreenMain3FavAndVisitVM({
    required this.context,
    required this.placesInteractor,
  });

  BuildContext context;
  PlacesInteractor placesInteractor;

  List<Place> favoritePlaces = [];
  List<Place> visitedPlaces = [];

  void initVM() {
    loadData();
    placesInteractor.addListener(_placesInteractorListener);
  }

  void _placesInteractorListener() {
    loadData();
    notifyListeners();
  }

  void disposeVM() {
    placesInteractor.removeListener(_placesInteractorListener);
  }

  //

  void loadData() {
    favoritePlaces = placesInteractor.getFavoritesPlaces;
    visitedPlaces = placesInteractor.getVisitedPlaces;
  }

  void onRemoveFromFavorites(int id) {
    placesInteractor.removeFromFavorites(id);
  }

  void onRemoveFromVisited(int id) {
    placesInteractor.removeFromVisited(id);
  }
}

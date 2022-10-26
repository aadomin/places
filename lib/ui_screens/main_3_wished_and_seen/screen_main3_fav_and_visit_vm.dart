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

  bool isLoading = true;

  void initVM() {
    _loadData();
    placesInteractor.addListener(_placesInteractorListener);
  }

  void _placesInteractorListener() {
    _loadData();
  }

  void disposeVM() {
    placesInteractor.removeListener(_placesInteractorListener);
  }

  //

  Future<void> _loadData() async {
    isLoading = true;
    notifyListeners();
    favoritePlaces = placesInteractor.getFavoritesPlaces;
    visitedPlaces = placesInteractor.getVisitedPlaces;
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }

  void onRemoveFromFavorites(int id) {
    placesInteractor.removeFromFavorites(id);
  }

  void onRemoveFromVisited(int id) {
    placesInteractor.removeFromVisited(id);
  }
}

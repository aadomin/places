import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/app_actions.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/redux_store.dart';

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

  void removeFromFavorites(int id) {
    placesInteractor.removeFromFavorites(id);
  }

  void removeFromVisited(int id) {
    placesInteractor.removeFromVisited(id);
  }
}

ReduxStore appReducers(ReduxStore state, dynamic action) {
  if (action is RemoveFromFavoritesAction) {
    reduxPlacesInteractor.removeFromFavorites(action.id); //TODO
    return ReduxStore(
      favoritePlaces: reduxPlacesInteractor.getFavoritesPlaces,
      visitedPlaces: reduxPlacesInteractor.getFavoritesPlaces,
    );
  } else if (action is RemoveFromVisitedAction) {
    reduxPlacesInteractor.removeFromVisited(action.id); //TODO
    return ReduxStore(
      favoritePlaces: reduxPlacesInteractor.getFavoritesPlaces,
      visitedPlaces: reduxPlacesInteractor.getFavoritesPlaces,
    );
  } else if (action is LoadDataAction) {
    return ReduxStore(
      favoritePlaces: reduxPlacesInteractor.getFavoritesPlaces,
      visitedPlaces: reduxPlacesInteractor.getFavoritesPlaces,
    );
  }
  throw Exception();
}

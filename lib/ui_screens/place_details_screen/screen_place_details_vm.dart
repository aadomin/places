import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_screens/popups/popup_manager.dart';

class ScreenPlaceDetailsVM with ChangeNotifier {
  ScreenPlaceDetailsVM({
    required this.context,
    required this.placesInteractor,
    required this.popupManager,
  }) {
    placesInteractor.addListener(_placesInteractorListener);
  }

  BuildContext context;
  final PlacesInteractor placesInteractor;
  final PopupManager popupManager;

  void _placesInteractorListener() => notifyListeners();

  //method dispose должен быть вызван из виджета
  void dispose() {
    placesInteractor.removeListener(_placesInteractorListener);
  }

  //

  Place getPlaceDetails({required int placeId}) =>
      placesInteractor.getPlaceDetails(placeId);
}

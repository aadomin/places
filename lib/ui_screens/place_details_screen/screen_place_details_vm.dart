import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_screens/popups/popup_manager.dart';

class ScreenPlaceDetailsVM with ChangeNotifier {
  ScreenPlaceDetailsVM({
    required this.context,
    required this.placesInteractor,
    required this.popupManager,
  });

  BuildContext context;
  final PlacesInteractor placesInteractor;
  final PopupManager popupManager;

  void initVM() {
    placesInteractor.addListener(_placesInteractorListener);
  }

  void _placesInteractorListener() => notifyListeners();

  void disposeVM() {
    placesInteractor.removeListener(_placesInteractorListener);
  }

  //

  Place getPlaceDetails({required int placeId}) =>
      placesInteractor.getPlaceDetails(placeId);

  void onRemoveFromFavorites({required int placeId}) =>
      placesInteractor.removeFromFavorites(placeId);

  void onAddToFavorites({required int placeId}) =>
      placesInteractor.addToFavorites(placeId);

  Future<void> onShowPopupSchedulePlace({required int placeId}) async =>
      popupManager.showPopupSchedulePlace(context, placeId);
}

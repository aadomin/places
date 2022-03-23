import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/ui_commons/popup_manager.dart';

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

  // bool get isDarkThemeOn => settingsEntity.isDarkThemeOn;

  // void onTapOnTutorialLink() {
  //   Navigator.of(context).pushNamed(ROUTE_ONBOARDING);
  // }

}

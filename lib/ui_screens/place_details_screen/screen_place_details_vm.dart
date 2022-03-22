import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';

class ScreenPlaceDetailsVM with ChangeNotifier {
  ScreenPlaceDetailsVM({
    required this.context,
    required this.placesInteractor,
  }) {
    placesInteractor.addListener(_placesInteractorListener);
  }

  BuildContext context;
  final PlacesInteractor placesInteractor;
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

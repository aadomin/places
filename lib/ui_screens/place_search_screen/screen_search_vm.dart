import 'package:flutter/material.dart';
import 'package:places/domain_interactors/search_interactor.dart';

class ScreenSearchVM with ChangeNotifier {
  ScreenSearchVM({
    required this.context,
    required this.searchInteractor,
  });

  BuildContext context;
  final SearchInteractor searchInteractor;

  void _placesInteractorListener() => notifyListeners();

  void init() {
    searchInteractor.addListener(_placesInteractorListener);
  }

  //method dispose должен быть вызван из виджета
  void dispose() {
    searchInteractor.removeListener(_placesInteractorListener);
  }

  //

}

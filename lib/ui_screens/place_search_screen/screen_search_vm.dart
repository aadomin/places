import 'package:flutter/material.dart';
import 'package:places/domain_interactors/search_interactor.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_commons/enums.dart';

class ScreenSearchVM with ChangeNotifier {
  ScreenSearchVM({
    required this.context,
    required this.searchInteractor,
  });

  BuildContext context;
  final SearchInteractor searchInteractor;

  void initVM() {
    searchInteractor.addListener(_searchInteractorListener);
  }

  void _searchInteractorListener() => notifyListeners();

  //method dispose должен быть вызван из виджета // ого This method overrides a method annotated as mustCallSuper
  void disposeVM() {
    searchInteractor.removeListener(_searchInteractorListener);
  }

  //

  void onSearchFieldChanged(String value) =>
      searchInteractor.searchPlaces(value);

  void onTapOnClearButton() => searchInteractor.searchPlaces('');

  void onTapOnRemoveItemFromHistory(int i) =>
      searchInteractor.removeItemFromHistory(i);

  void onTapOnRemoveAllItemsFromHistory() =>
      searchInteractor.removeAllHelpersFromHistory();

  void onTapOnOneOfLastSearches(int i) =>
      searchInteractor.searchPlaces(lastSearchesSnapshot[i]);

  SearchStatus get searchStatus => searchInteractor.searchStatus;

  List<Place> get searchResult => searchInteractor.searchResult;

  List<String> get lastSearchesSnapshot => searchInteractor.lastSearches;
}

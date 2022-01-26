import 'package:flutter/material.dart';
import 'package:places/domain_entities/history_of_search_services.dart';

import 'package:places/ui_commons/enums.dart';

import 'package:places/domain_models/place.dart';
import 'package:places/ui_interactors/place_interactor.dart';

///
/// Интерактор поиска
///
class SearchInteractor with ChangeNotifier {
  final placeInteractor = PlaceInteractor();

  SearchStatus searchStatus = SearchStatus.empty;
  List<Place> _searchResult = [];

  List<String> _lastSearches = [];

  List<String> get lastSearches {
    return _lastSearches;
  }

  List<Place> get searchResult {
    return _searchResult;
  }

  void searchPlaces(String searchText) {
    _doSearchItself(searchText);
    _updateListOfLastSearches(searchText);
    notifyListeners();
  }

  void _doSearchItself(String searchText) {
    // тут лучше бы вызов функции через время, и если за это время введен еще один
    // символ - изменение времени, от того, как она отсчитывается.

    final String _searchText = searchText;

    final List<Place> result = [];

    if (_searchText == '') {
      searchStatus = SearchStatus.empty;
    } else {
      for (var i = 0; i < placeInteractor.filteredPlaces.length; i++) {
        if (placeInteractor.filteredPlaces[i].name
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          result.add(placeInteractor.filteredPlaces[i]);
        }
      }

      if (result.isNotEmpty) {
        searchStatus = SearchStatus.haveResult;
      } else {
        searchStatus = SearchStatus.notFound;
      }
    }
    _searchResult = result;
  }

  void _updateListOfLastSearches(String searchText) {
    _lastSearches = HistoryOfSearchServices.newListOfLastSearches(
      maxCountOfItems: 5,
      newInput: searchText,
      lastSearches: lastSearches,
    );
  }

  void removeItemFromHistory(int index) {
    _lastSearches.removeAt(index);
    notifyListeners();
  }

  void removeAllItemsFromHistory() {
    _lastSearches.clear();
    notifyListeners();
  }
}

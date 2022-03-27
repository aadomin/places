import 'package:flutter/material.dart';
import 'package:places/data_repositories/search_repository.dart';
import 'package:places/domain_interactors/history_of_search_services.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/domain_interactors/place_interactor.dart';

///
/// Интерактор поиска
///
class SearchInteractor with ChangeNotifier {
  SearchInteractor({
    required this.searchRepository,
    required this.placesInteractor,
  });

  final SearchRepository searchRepository;
  final PlacesInteractor placesInteractor;

  /// Результат поиска
  List<Place> _searchResult = [];

  /// Результат поиска
  List<Place> get searchResult {
    return _searchResult;
  }

  /// Результат поиска - статус
  SearchStatus searchStatus = SearchStatus.empty;

  /// История поиска
  List<String> get _lastSearches => searchRepository.lastSearches;

  /// История поиска
  set _lastSearches(List<String> value) {
    searchRepository.lastSearches = value;
  }

  /// История поиска
  List<String> get lastSearches {
    return _lastSearches;
  }

  ///
  /// Выполняет поиск и сохраняет место в истории поиска
  ///
  void searchPlaces(String searchText) {
    _doSearchItself(searchText);
    _updateListOfLastSearches(searchText);
    notifyListeners();
  }

  ///
  /// Выполняет собственно поиск, работает с placeInteractor,
  /// Результат забирается из placeInteractor.getFilteredPlaces
  /// и сохраняется _searchResult.
  ///
  void _doSearchItself(String searchText) {
    // тут лучше бы вызов функции через время, и если за это время введен еще один
    // символ - изменение времени, от того, как она отсчитывается.

    final String _searchText = searchText;

    final List<Place> result = [];

    if (_searchText == '') {
      searchStatus = SearchStatus.empty;
    } else {
      for (var i = 0; i < placesInteractor.getFilteredPlaces.length; i++) {
        if (placesInteractor.getFilteredPlaces[i].name
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          result.add(placesInteractor.getFilteredPlaces[i]);
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

  ///
  /// Обновить историю поиска (обновить список)
  ///
  void _updateListOfLastSearches(String searchText) {
    _lastSearches = _newListOfLastSearches(
      maxCountOfItems: 5,
      newInput: searchText,
      lastSearches: lastSearches,
    );
  }

  ///
  /// Удалить пункт из истории поиска
  ///
  void removeItemFromHistory(int index) {
    _lastSearches.removeAt(index);
    notifyListeners();
  }

  ///
  /// Очистить историю поиска
  ///
  void removeAllItemsFromHistory() {
    _lastSearches.clear();
    notifyListeners();
  }

  List<String> _newListOfLastSearches({
    required String newInput,
    required List<String> lastSearches,
    required int maxCountOfItems,
  }) {
    return HistoryOfSearchService.newListOfLastSearches(
        newInput: newInput,
        lastSearches: lastSearches,
        maxCountOfItems: maxCountOfItems);
  }
}

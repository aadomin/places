import 'package:flutter/material.dart';
import 'package:places/main.dart';

import 'package:places/ui_my_app/enums.dart';

import 'package:places/domain_models/place.dart';
import 'package:places/ui_interactors/place_interactor.dart';

class SearchInteractor with ChangeNotifier {
  // Singleton
  factory SearchInteractor() => _instance ?? SearchInteractor._internal();
  static SearchInteractor? _instance;
  SearchInteractor._internal() {
    _instance = this;
    //
    _lastSearches = searchEntity.lastSearches;
  }
  // Singleton

  final placeInteractor = PlaceInteractor();

  SearchStatus searchStatus = SearchStatus.empty;
  List<Place> _searchResult = [];
  String _searchText = '';

  late final List<String> _lastSearches;
  DateTime _lastSearchDateTime = DateTime.now();

  List<String> get lastSearches {
    return _lastSearches;
  }

  List<Place> get searchResult {
    return _searchResult;
  }

  void searchPlaces(String searchText) {
    doSearchItSelf(searchText);
    updateListOfLastSearches(searchText);
    notifyListeners();
  }

  void doSearchItSelf(String searchText) {
    _searchText = searchText;
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

  void updateListOfLastSearches(String searchText) {
    final now = DateTime.now();
    final int diffOfTime = now.difference(_lastSearchDateTime).inSeconds;

    if (searchText == '') {
      return;
    }

    // если прошло больше 2 секунды => это уже новый запрос
    if (diffOfTime > 2) {
      _lastSearches.insert(0, searchText);
      if (_lastSearches.length > 5) {
        _lastSearches.removeAt(_lastSearches.length - 1);
      }
    } else {
      if (_lastSearches.isEmpty) {
        if (searchText != '') {
          _lastSearches.add(searchText);
        }
      } else {
        _lastSearches[0] = searchText;
      }
    }
    for (var i = 0; i < _lastSearches.length; i++) {
      if (_lastSearches[i] == '') {
        _lastSearches.removeAt(i);
      }
    }
    _lastSearchDateTime = now;
  }

  void removeItemFromHistory(int index) {
    _lastSearches.removeAt(index);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:places/data/interactors/place_interactor.dart';

import 'package:places/enums.dart';

import 'package:places/data/models/place.dart';

class MySearchModel with ChangeNotifier {
  //TEMP
  final placeInteractor = PlaceInteractor();

  var searchStatus = SearchStatus.empty;
  List<Sight> _searchResult = [];
  String _searchText = '';

  final List<String> _lastSearches = [];
  DateTime _lastSearchDateTime = DateTime.now();

  List<String> get lastSearches {
    return _lastSearches;
  }

  List<Sight> get searchResult {
    return _searchResult;
  }

  void newSearch(String searchText) {
    doSearchItSelf(searchText);
    updateListOfLastSearches(searchText);
    notifyListeners();
  }

  void doSearchItSelf(String searchText) {
    _searchText = searchText;
    final List<Sight> result = [];

    if (_searchText == '') {
      searchStatus = SearchStatus.empty;
    } else {
      for (var i = 0; i < placeInteractor.items.length; i++) {
        if (placeInteractor.items[i].name
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          result.add(placeInteractor.items[i]);
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

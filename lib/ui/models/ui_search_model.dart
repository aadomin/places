import 'package:places/mocks.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../domain/sight.dart';

class MySearchModel with ChangeNotifier {
  String searchStatus = 'empty';
  List<Sight> _searchResult = [];
  String _searchText = '';
  List<String> _lastSearches = [];
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
    List<Sight> result = [];

    if (_searchText == '') {
      searchStatus = 'empty';
    } else {
      // TODO запрос к БД
      for (var i = 0; i < mocks.length; i++) {
        if (mocks[i].name.contains(_searchText)) {
          result.add(mocks[i]);
        }
      }

      if (result.length > 0) {
        searchStatus = 'have result';
      } else {
        searchStatus = 'not found';
      }
    }
    _searchResult = result;
  }

  void updateListOfLastSearches(String searchText) {
    var now = DateTime.now();
    int diffOfTime = now.difference(_lastSearchDateTime).inSeconds;

    // если прошло больше 1 секунды => это уже новый запрос
    if (diffOfTime > 1) {
      _lastSearches.insert(0, searchText);
      if (_lastSearches.length > 5) {
        _lastSearches.removeAt(_lastSearches.length - 1);
      }
    } else {
      if (_lastSearches.length == 0) {
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

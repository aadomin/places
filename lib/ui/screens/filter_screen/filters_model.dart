import 'package:flutter/material.dart';

import 'package:places/data/interactors/search_interactor.dart';
import 'package:places/data/models/filter_item.dart';

class MyFilterModel with ChangeNotifier {
  MyFilterModel() {
    // при появлении объекта из стрима обновляем интерфейс
    searchInteractor.items.listen((items) {
      _filterItems = items;
      notifyListeners();
    });
  }

  final SearchInteractor searchInteractor = SearchInteractor();

  late List<FilterItem> _filterItems;
  List<FilterItem> get filterItems => _filterItems;

  void switchSelection(int index) {
    searchInteractor.switchActiveCategories(index);
  }

  void clearSelection() {
    searchInteractor.clearActiveCategories();
  }
}

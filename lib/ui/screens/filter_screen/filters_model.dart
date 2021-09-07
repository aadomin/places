import 'package:flutter/material.dart';

import 'package:places/data/interactors/search_interactor.dart';
import 'package:places/data/models/filter_item.dart';

class MyFilterModel with ChangeNotifier {
  MyFilterModel() {
    //core = CoreSingleton();

    // при появлении объекта из стрима обновляем интерфейс
    categoriesFilter.items.listen((items) {
      _filterItems = items;
      notifyListeners();
    });
  }
  //late CoreSingleton core;

  SearchInteractor categoriesFilter = SearchInteractor();

  late List<FilterItem> _filterItems;
  List<FilterItem> get filterItems => _filterItems;

  void switchSelection(int index) {
    categoriesFilter.switchActiveCategories(index);
  }

  void clearSelection() {
    categoriesFilter.clearActiveCategories();
  }
}

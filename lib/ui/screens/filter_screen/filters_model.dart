import 'package:flutter/material.dart';
import 'package:places/data/filter.dart';
import 'package:places/domain/FilterItem.dart';

class MyFilterModel with ChangeNotifier {
  List<FilterItem> _filterItems = [
    FilterItem('Отель', 'res/images/hotel.png'),
    FilterItem('Ресторан', 'res/images/rest.png'),
    FilterItem('Особое место', 'res/images/special.png'),
    FilterItem('Парк', 'res/images/park.png'),
    FilterItem('Музей', 'res/images/museum.png'),
    FilterItem('Кафе', 'res/images/cafe.png'),
  ];

  List<FilterItem> get filterItems => _filterItems;

  // Stream<Counter> getCounter() => _storage.counter.map((c) => Counter(c));

  void switchSelection(int index) {
    _filterItems[index].isSelected = !_filterItems[index].isSelected;
    notifyListeners();
  }

  void clearSelection() {
    for (var item in _filterItems) {
      item.isSelected = false;
    }
    notifyListeners();
  }
}

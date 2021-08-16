import '../domain/FilterItem.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CategoriesFilter {
  CategoriesFilter() {
    _streamItems = BehaviorSubject<List<FilterItem>>.seeded(_filterItems);
  }

  BehaviorSubject<List<FilterItem>> _streamItems;
  Stream<List<FilterItem>> get items => _streamItems.stream;

  void switchSelection(int index) {
    _filterItems[index].isSelected = !_filterItems[index].isSelected;
    _streamItems.add(_filterItems);
  }

  void clearSelection() {
    for (var element in _filterItems) {
      element.isSelected = false;
    }
    _streamItems.add(_filterItems);
  }

  List<FilterItem> _filterItems = [
    FilterItem(
      name: 'Отель',
      assetPath: 'res/images/hotel.png',
      isSelected: false,
    ),
    FilterItem(
      name: 'Ресторан',
      assetPath: 'res/images/rest.png',
      isSelected: false,
    ),
    FilterItem(
        name: 'Особое место',
        assetPath: 'res/images/special.png',
        isSelected: false),
    FilterItem(
      name: 'Парк',
      assetPath: 'res/images/park.png',
      isSelected: false,
    ),
    FilterItem(
      name: 'Музей',
      assetPath: 'res/images/museum.png',
      isSelected: false,
    ),
    FilterItem(
      name: 'Кафе',
      assetPath: 'res/images/cafe.png',
      isSelected: false,
    ),
  ];
}

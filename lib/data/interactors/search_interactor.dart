import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:places/data/models/filter_item.dart';

//
// Реализуйте функцию поиска по имени, сохранение и удаление истории поиска
//

class SearchInteractor with ChangeNotifier {
  // Singleton
  factory SearchInteractor() => _instance ?? SearchInteractor._internal();
  SearchInteractor._internal() {
    _instance = this;
    _streamItems = BehaviorSubject<List<FilterItem>>.seeded(_filterItems);
  }
  static SearchInteractor? _instance;

  //
  late BehaviorSubject<List<FilterItem>> _streamItems;
  Stream<List<FilterItem>> get items => _streamItems.stream;

  void switchActiveCategories(int index) {
    _filterItems[index].isSelected = !_filterItems[index].isSelected;
    _streamItems.add(_filterItems);
  }

  void clearActiveCategories() {
    for (final element in _filterItems) {
      element.isSelected = false;
    }
    _streamItems.add(_filterItems);
  }

  final List<FilterItem> _filterItems = [
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


// Напишите функцию searchPlaces(name:String), которая выполняет запрос из репозитория filteredPlaces с параметром названия места
// После успешного выполнения запроса, сохраните поисковый запрос в список в интеракторе. Позднее перенесете данные из массива в базу.
// В интеракторе реализуйте настройку фильтров и радиуса поиска
// Напишите функцию очистки истории поиска
// Подключите интерактор к экрану поиска и к экрану фильтров
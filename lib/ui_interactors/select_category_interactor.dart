import 'package:flutter/material.dart';
import 'package:places/domain_models/category_item.dart';
import 'package:places/ui_commons/ui_strings.dart';

///
/// Интерактор выбора категории
///
class SelectionCategoryInteractor with ChangeNotifier {
  ///
  /// Список категорий
  ///
  final List<CategoryItem> _allCategories = [
    CategoryItem(name: UiStrings.notSelected, isSelected: true),
    CategoryItem(name: UiStrings.hotel, isSelected: false),
    CategoryItem(name: UiStrings.restaurant, isSelected: false),
    CategoryItem(name: UiStrings.specialPlace, isSelected: false),
    CategoryItem(name: UiStrings.theatre, isSelected: false),
    CategoryItem(name: UiStrings.museum, isSelected: false),
    CategoryItem(name: UiStrings.cafe, isSelected: false),
  ];

  ///
  /// Список категорий
  ///
  List<CategoryItem> get allCategories => _allCategories;

  ///
  /// Переключить выбранность категории
  ///
  void toggleCategorySelection(int index) {
    if (_allCategories[index].isSelected) {
      _allCategories[index].isSelected = false;
      _allCategories[0].isSelected = true;
    } else {
      for (final i in _allCategories) {
        i.isSelected = false;
      }
      _allCategories[index].isSelected = true;
    }

    notifyListeners();
  }

  ///
  /// Выбранная категория
  ///
  String get selectedCategory {
    var result = '';
    for (var i = 0; i < _allCategories.length; i++) {
      if (_allCategories[i].isSelected) {
        result = _allCategories[i].name;
      }
    }
    return result;
  }
}

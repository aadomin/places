import 'package:flutter/material.dart';
import 'package:places/ui_models/category_item.dart';
import 'package:places/ui_commons/ui_strings.dart';

///
/// Интерактор выбора категории
///
class SelectionCategoryVM with ChangeNotifier {
  SelectionCategoryVM({
    this.selectedCategory = UiStrings.notSelected,
  }) {
    init();
  }

  ///
  /// Инициализация
  ///
  void init() {
    for (final item in _allCategories) {
      // ignore: unnecessary_parenthesis
      item.isSelected = (item.name == selectedCategory);
    }
  }

  /// Выбранная в данный момент категория
  String selectedCategory;

  ///
  /// Список категорий
  ///
  final _allCategories = [
    CategoryItem(name: UiStrings.notSelected, isSelected: false),
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
  void toggleCategorySelection(String categoryName) {
    selectedCategory = categoryName;
    for (final item in _allCategories) {
      // ignore: unnecessary_parenthesis
      item.isSelected = (item.name == selectedCategory);
    }
    notifyListeners();
  }
}

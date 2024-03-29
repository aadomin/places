import 'package:flutter/material.dart';
import 'package:places/domain_entities/category_item.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// View-model for selection of category screen
class ScreenSelectionCategoryVM with ChangeNotifier {
  ScreenSelectionCategoryVM({
    required this.context,
    this.selectedCategory = UiStrings.notSelected,
  });

  String selectedCategory;
  BuildContext context;

  /// List of categories
  final _allCategories = const [
    CategoryItem(name: UiStrings.notSelected, isSelected: false),
    CategoryItem(name: UiStrings.hotel, isSelected: false),
    CategoryItem(name: UiStrings.restaurant, isSelected: false),
    CategoryItem(name: UiStrings.specialPlace, isSelected: false),
    CategoryItem(name: UiStrings.theatre, isSelected: false),
    CategoryItem(name: UiStrings.museum, isSelected: false),
    CategoryItem(name: UiStrings.cafe, isSelected: false),
  ];

  List<CategoryItem> get allCategories => _allCategories;

  void initVM() {
    _updateCaterogiesList();
  }

  void disposeVM() {}

  /// Toggle selected category
  void onToggleSelectedCategory(String categoryName) {
    selectedCategory = categoryName;
    _updateCaterogiesList();
  }

  void _updateCaterogiesList() {
    _allCategories.map((item) {
      return CategoryItem(
        name: item.name,
        isSelected: item.name == selectedCategory,
      );
    });
    notifyListeners();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onSave() {
    Navigator.pop(context, selectedCategory);
  }
}

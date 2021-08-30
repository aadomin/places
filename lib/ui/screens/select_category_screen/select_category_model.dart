import 'package:flutter/material.dart';

class MyCategoriesModel with ChangeNotifier {
  final List<CategoryItem> _myCategories = [
    CategoryItem(name: 'не выбрана', isSelected: true),
    CategoryItem(name: 'Отель', isSelected: false),
    CategoryItem(name: 'Ресторан', isSelected: false),
    CategoryItem(name: 'Особое место', isSelected: false),
    CategoryItem(name: 'Театр', isSelected: false),
    CategoryItem(name: 'Музей', isSelected: false),
    CategoryItem(name: 'Кафе', isSelected: false),
  ];

  List<CategoryItem> get myCategories => _myCategories;

  void switchCategoryCheck(int index) {
    if (_myCategories[index].isSelected) {
      _myCategories[index].isSelected = false;
      _myCategories[0].isSelected = true;
    } else {
      for (var i in _myCategories) {
        i.isSelected = false;
      }
      _myCategories[index].isSelected = true;
    }

    notifyListeners();
  }

  String get currentlySelected {
    var result = '';
    for (var i = 0; i < _myCategories.length; i++) {
      if (_myCategories[i].isSelected) {
        result = _myCategories[i].name;
      }
    }
    return result;
  }
}

class CategoryItem {
  CategoryItem({
    required this.name,
    required this.isSelected,
  });

  String name;
  bool isSelected;
}

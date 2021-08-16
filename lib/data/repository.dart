import 'categories_filter.dart';

class Repository {
  
  // Singleton
  static Repository _instance;
  Repository._internal() {
    _instance = this;
  }
  factory Repository() => _instance ?? Repository._internal();

  // general
  CategoriesFilter categoriesFilter = CategoriesFilter();
  // TODO добавить остальные части бизнес-логики
}

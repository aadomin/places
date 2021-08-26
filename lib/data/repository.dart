import '_categories_filter.dart';
import '_sights_storage.dart';

class Repository {
  // Singleton
  static Repository? _instance;
  Repository._internal() {
    _instance = this;
  }
  factory Repository() => _instance ?? Repository._internal();

  // modules
  CategoriesFilter categoriesFilter = CategoriesFilter();
  SightsStorage sightsStorage = SightsStorage();
}

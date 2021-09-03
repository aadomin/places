import 'package:places/data/interactors/_categories_filter.dart';
import 'package:places/data/interactors/_sights_storage.dart';

class Repository {
  // Singleton
  factory Repository() => _instance ?? Repository._internal();
  Repository._internal() {
    _instance = this;
  }
  static Repository? _instance;

  // modules
  CategoriesFilter categoriesFilter = CategoriesFilter();
  SightsStorage sightsStorage = SightsStorage();
}

import 'package:places/data/interactors/search_interactor.dart';
import 'package:places/data/interactors/places_interactor.dart';

class CoreSingleton {
  // Singleton
  factory CoreSingleton() => _instance ?? CoreSingleton._internal();
  CoreSingleton._internal() {
    _instance = this;
  }
  static CoreSingleton? _instance;

  // modules
  CategoriesFilter categoriesFilter = CategoriesFilter();
  PlaceInteractor sightsStorage = PlaceInteractor();
}

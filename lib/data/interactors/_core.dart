import 'package:places/data/interactors/place_interactor.dart';
import 'package:places/data/interactors/search_interactor.dart';
import 'package:places/data/interactors/settings_interactor.dart';

class CoreSingleton {
  // Singleton
  factory CoreSingleton() => _instance ?? CoreSingleton._internal();
  CoreSingleton._internal() {
    _instance = this;
  }
  static CoreSingleton? _instance;

  // modules
  SearchInteractor categoriesFilter = SearchInteractor();
  PlaceInteractor sightsStorage = PlaceInteractor();
  SettingsInteractor settingsInteractor = SettingsInteractor();
}

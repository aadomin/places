import 'package:places/data/repositories/search_repository.dart';
import 'package:places/data/repositories/place_repository.dart';
import 'package:places/data/repositories/settings_repository.dart';

class Repository {
  // Singleton
  factory Repository() => _instance ?? Repository._internal();
  Repository._internal() {
    _instance = this;
  }
  static Repository? _instance;

  // modules
  SearchRepository searchRepository = SearchRepository();
  PlaceRepository placeRepository = PlaceRepository();
  SettingsRepository settingsRepository = SettingsRepository();
}

// ignore_for_file: annotate_overrides, overridden_fields

import 'package:places/data_repositories/dio_services.dart';
import 'package:places/data_repositories/geo_repository.dart';
import 'package:places/data_repositories/places/place_repository.dart';
import 'package:places/data_repositories/search_repository.dart';
import 'package:places/data_repositories/settings_repository.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/geo_interactor.dart';
import 'package:places/domain_interactors/hardwork_interactor.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_interactors/search_interactor.dart';
import 'package:places/domain_interactors/settings_interactor.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_screens/popups/popup_manager.dart';

class DI {
  DI() {
    placesInteractorG = placesInteractor;
  }
  late final platformDetector = PlatformDetector();

  late final _settingsRepository = SettingsRepository();
  late final settingsInteractor =
      SettingsInteractor(settingsRepository: _settingsRepository);

  late final _geoRepository = GeoRepository();
  late final geoInteractor = GeoInteractor(geoRepository: _geoRepository);

  late final filterInteractor = FilterInteractor();

  late final _dioServices = DioServices();
  late final _placesRepository = PlaceRepository(dio: _dioServices.dio);
  late final placesInteractor = PlacesInteractor(
    placesRepository: _placesRepository,
    geoInteractor: geoInteractor,
    filterInteractor: filterInteractor,
  )..initInteractor();

  late final _searchRepository = SearchRepository();
  late final searchInteractor = SearchInteractor(
    searchRepository: _searchRepository,
    placesInteractor: placesInteractor,
  );

  late final hardworkInteractor = HardworkInteractor();

  final popupManager = PopupManager();
}

late final PlacesInteractor placesInteractorG;

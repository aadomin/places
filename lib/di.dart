import 'package:flutter/material.dart';
import 'package:places/data_repositories/dio_services.dart';
import 'package:places/data_repositories/geo_repository.dart';
import 'package:places/data_repositories/place_repository.dart';
import 'package:places/data_repositories/search_repository.dart';
import 'package:places/data_repositories/settings_repository.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/geo_services.dart';
import 'package:places/domain_interactors/hardwork_services.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_interactors/search_interactor.dart';
import 'package:places/domain_interactors/settings_interactor.dart';

class DI{
  final _settingsRepository = SettingsRepository();
  late final settingsInteractor =
      SettingsInteractor(settingsRepository: _settingsRepository);

  final _geoRepository = GeoRepository();
  late final geoInteractor = GeoServices(geoRepository: _geoRepository);

  final filterInteractor = FilterInteractor();
  
  final _dioServices = DioServices();
  late final _placesRepository = PlaceRepository(dio: _dioServices.dio);
  late final placesInteractor = PlacesInteractor(
    placesRepository: _placesRepository,
    geoServices: geoInteractor,
    filterInteractor: filterInteractor,
  );

  final _searchRepository = SearchRepository();
  late final searchInteractor = SearchInteractor(
    searchRepository: _searchRepository,
    placesInteractor: placesInteractor,
  );

  final hardworkInteractor = HardworkInteractor();
}

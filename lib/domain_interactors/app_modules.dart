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
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_screens/popups/popup_manager.dart';

class AppModules {
  late final dioServices = DioServices();

  late final geoRepository = GeoRepository();
  late final geoServices = GeoServices(geoRepository: geoRepository);

  final settingsRepository = SettingsRepository();
  late final settingsInteractor =
      SettingsInteractor(settingsRepository: settingsRepository);

  late final filterInteractor = FilterInteractor();
  late final placesRepository = PlaceRepository(dio: dioServices.dio);
  late final placesInteractor = PlacesInteractor(
    placesRepository: placesRepository,
    geoServices: geoServices,
    filterInteractor: filterInteractor,
  );
  late final popupManager = PopupManager();
  final searchRepository = SearchRepository();
  late final searchInteractor = SearchInteractor(
    searchRepository: searchRepository,
    placesInteractor: placesInteractor,
  );

  final hardworkServices = HardworkServices();

  final platformDetector = PlatformDetector();
}

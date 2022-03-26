import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:places/data_repositories/dio_services.dart';
import 'package:places/di.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/hardwork_services.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_screens/popups/popup_manager.dart';
import 'package:provider/provider.dart';
import 'package:places/data_repositories/geo_repository.dart';
import 'package:places/data_repositories/place_repository.dart';
import 'package:places/data_repositories/search_repository.dart';
import 'package:places/domain_interactors/geo_services.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/ui_commons/my_bloc_observer.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/domain_interactors/search_interactor.dart';
import 'package:places/data_repositories/settings_repository.dart';
import 'package:places/domain_interactors/settings_interactor.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyAppProvider());
}

class MyAppProvider extends StatelessWidget {
  MyAppProvider({
    Key? key,
  }) : super(key: key);

  final settingsRepository = SettingsRepository();
  late final settingsInteractor =
      SettingsInteractor(settingsRepository: settingsRepository);

  final geoRepository = GeoRepository();
  late final _geoInteractor = GeoServices(geoRepository: geoRepository);

  final dioServices = DioServices();
  final filterInteractor = FilterInteractor();
  late final placesRepository = PlaceRepository(dio: dioServices.dio);
  late final placesInteractor = PlacesInteractor(
    placesRepository: placesRepository,
    geoServices: _geoInteractor,
    filterInteractor: filterInteractor,
  );

  final searchRepository = SearchRepository();
  late final searchInteractor = SearchInteractor(
    searchRepository: searchRepository,
    placesInteractor: placesInteractor,
  );

  final hardworkInteractor = HardworkInteractor();

  final di = DI();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => hardworkInteractor,
        ),
        ChangeNotifierProvider(
          create: (context) => filterInteractor,
        ),
        ChangeNotifierProvider(
          create: (context) => settingsInteractor,
        ),
        ChangeNotifierProvider(
          create: (context) => searchInteractor,
        ),
        ChangeNotifierProvider(
          create: (context) => placesInteractor,
        ),
        Provider(
          create: (context) => di,
        ),
        ChangeNotifierProvider(
          create: (context) => PopupManager(),
        ),
      ],
      child: const MyAppAndRoutes(),
    );
  }
}

PlatformDetector platformDetector = PlatformDetector();

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;

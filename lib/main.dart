import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:places/data_repositories/dio_services.dart';
import 'package:places/di.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/hardwork_interactor.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_screens/popups/popup_manager.dart';
import 'package:provider/provider.dart';
import 'package:places/data_repositories/geo_repository.dart';
import 'package:places/data_repositories/place_repository.dart';
import 'package:places/data_repositories/search_repository.dart';
import 'package:places/domain_interactors/geo_interactor.dart';
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

  // final _settingsRepository = SettingsRepository();
  // late final settingsInteractor =
  //     SettingsInteractor(settingsRepository: _settingsRepository);

  // final _geoRepository = GeoRepository();
  // late final geoInteractor = GeoInteractor(geoRepository: _geoRepository);

  // final filterInteractor = FilterInteractor();

  // final _dioServices = DioServices();
  // late final _placesRepository = PlaceRepository(dio: _dioServices.dio);
  // late final placesInteractor = PlacesInteractor(
  //   placesRepository: _placesRepository,
  //   geoInteractor: geoInteractor,
  //   filterInteractor: filterInteractor,
  // );

  // final _searchRepository = SearchRepository();
  // late final searchInteractor = SearchInteractor(
  //   searchRepository: _searchRepository,
  //   placesInteractor: placesInteractor,
  // );

  // final hardworkInteractor = HardworkInteractor();

  //

  late final _di = DI();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => _di,
        ),
        Provider(
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

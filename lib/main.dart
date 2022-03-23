import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:places/data_repositories/dio_services.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/hardwork_services.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_commons/popup_manager.dart';
import 'package:provider/provider.dart';
import 'package:places/data_repositories/geo_repository.dart';
import 'package:places/data_repositories/place_repository.dart';
import 'package:places/data_repositories/search_repository.dart';
import 'package:places/domain_interactors/geo_services.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/ui_commons/my_bloc_observer.dart';
import 'package:places/my_app_and_routes.dart';

import 'package:places/ui_screens/filter_screen/screen_filter_vm.dart';
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

  late final geoRepository = GeoRepository();
  late final geoServices = GeoServices(geoRepository: geoRepository);
  late final dioServices = DioServices();
  late final filterInteractor = FilterInteractor();
  late final placesRepository = PlaceRepository(dio: dioServices.dio);
  late final placesInteractor = PlacesInteractor(
    placesRepository: placesRepository,
    geoServices: geoServices,
    filterInteractor: filterInteractor,
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PopupManager(),
      child: ChangeNotifierProvider(
        create: (context) => placesInteractor,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) {
                return FilterVM(placesInteractor: placesInteractor);
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                final settingsRepository = SettingsRepository();
                return SettingsInteractor(
                    settingsRepository: settingsRepository);
              },
            ),
            ChangeNotifierProvider(
              create: (context) {
                final searchRepository = SearchRepository();
                return SearchInteractor(
                  searchRepository: searchRepository,
                  placesInteractor: placesInteractor,
                );
              },
            ),
            ChangeNotifierProvider(
              create: (context) => HardworkServices(),
            ),
          ],
          child: const MyAppAndRoutes(),
        ),
      ),
    );
  }
}

PlatformDetector platformDetector = PlatformDetector();

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;

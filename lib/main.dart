import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:places/data_repositories/dio_service.dart';
import 'package:places/domain_entities/hardwork_services.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:provider/provider.dart';
import 'package:places/data_repositories/geo_repository.dart';
import 'package:places/data_repositories/place_repository.dart';
import 'package:places/data_repositories/search_repository.dart';
import 'package:places/domain_entities/geo_services.dart';
import 'package:places/domain_entities/place_entity.dart';
import 'package:places/ui_commons/my_bloc_observer.dart';
import 'package:places/my_app_and_routes.dart';

import 'package:places/ui_screens/filter_screen/screen_filter_vm.dart';
import 'package:places/domain_entities/search_entity.dart';
import 'package:places/data_repositories/settings_repository.dart';
import 'package:places/domain_entities/settings_entity.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyAppProvider());
}

class MyAppProvider extends StatelessWidget {
  MyAppProvider({
    Key? key,
  }) : super(key: key);

  late final geoRepository = GeoRepository();
  late final geoEntity = GeoServices(geoRepository: geoRepository);
  late final dioService = DioService();
  late final placeRepository = PlaceRepository(dio: dioService.dio);
  late final placeEntity = PlaceEntity(
    placeRepository: placeRepository,
    geoEntity: geoEntity,
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return placeEntity;
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return FilterVM(placeEntity: placeEntity);
            },
          ),
          ChangeNotifierProvider(
            create: (context) {
              final settingsRepository = SettingsRepository();
              return SettingsEntity(settingsRepository: settingsRepository);
            },
          ),
          ChangeNotifierProvider(
            create: (context) {
              final searchRepository = SearchRepository();
              return SearchEntity(
                searchRepository: searchRepository,
                placeInteractor: placeEntity,
              );
            },
          ),
          ChangeNotifierProvider(
            create: (context) => HardworkServices(),
          ),
        ],
        child: const MyAppAndRoutes(),
      ),
    );
  }
}

PlatformDetector platformDetector = PlatformDetector();

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;

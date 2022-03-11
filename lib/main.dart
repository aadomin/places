import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:provider/provider.dart';
import 'package:places/data_repositories/geo_repository.dart';
import 'package:places/data_repositories/place_repository.dart';
import 'package:places/data_repositories/search_repository.dart';
import 'package:places/domain_entities/geo_entity.dart';
import 'package:places/domain_entities/place_entity.dart';
import 'package:places/domain_entities/search_entity.dart';
import 'package:places/ui_commons/my_bloc_observer.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/domain_entities/place_vm.dart';

import 'package:places/ui_screens/filter_screen/screen_filter_vm.dart';
import 'package:places/domain_entities/search_entitiy2.dart';
import 'package:places/data_repositories/settings_repository.dart';
import 'package:places/domain_entities/settings_entity.dart';

late final FilterVM filterVM;
late final PlaceVM placeVM;
late final SearchEntity2 searchVM;

late final SettingsEntity settingsEntity;
late final GeoEntity geoEntity;
late final SearchEntity searchEntity;
late final PlaceEntity placeEntity;

void main() {
  final settingsRepository = SettingsRepository();
  settingsEntity = SettingsEntity(settingsRepository: settingsRepository);

  final geoRepository = GeoRepository();
  geoEntity = GeoEntity(geoRepository: geoRepository);

  final searchRepository = SearchRepository();
  searchEntity = SearchEntity(searchRepository: searchRepository);

  final placeRepository = PlaceRepository();
  placeEntity = PlaceEntity(placeRepository: placeRepository);

  placeVM = PlaceVM();
  filterVM = FilterVM(placeVM: placeVM);
  searchVM = SearchEntity2();

  Bloc.observer = MyBlocObserver();

  runApp(const MyAppProvider());
}

class MyAppProvider extends StatelessWidget {
  const MyAppProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return filterVM;
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return placeVM;
          },
        ),
        ChangeNotifierProvider(
          create: (context) => SearchEntity2(),
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

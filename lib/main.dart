import 'package:flutter/material.dart';
import 'package:places/data_repositories/geo_repository.dart';
import 'package:places/data_repositories/place_repository.dart';
import 'package:places/data_repositories/search_repository.dart';
import 'package:places/domain_entities/geo_entity.dart';
import 'package:places/domain_entities/place_entity.dart';
import 'package:places/domain_entities/search_entity.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_my_app/my_app.dart';

import 'package:places/ui_interactors/select_category_interactor.dart';
import 'package:places/ui_interactors/place_interactor.dart';
import 'package:places/ui_interactors/settings_interactor.dart';
import 'package:places/ui_interactors/filter_interactor.dart';
import 'package:places/ui_interactors/search_interactor.dart';

import 'package:places/data_repositories/settings_repository.dart';

import 'package:places/domain_entities/settings_entity.dart';

late final SettingsInteractor settingsInteractor;
late final FilterInteractor filterInteractor;

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

  // !!!
  filterInteractor = FilterInteractor();

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
        ChangeNotifierProvider<SettingsInteractor>(
          create: (context) {
            settingsInteractor = SettingsInteractor();
            return settingsInteractor;
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            //filterInteractor = FilterInteractor();
            return filterInteractor;
          },
        ),
        ChangeNotifierProvider(
          create: (context) => PlaceInteractor(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchInteractor(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectCategoryInteractor(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

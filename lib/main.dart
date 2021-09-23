import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/my_app/my_app.dart';

import 'package:places/data/interactors/place_interactor.dart';
import 'package:places/data/interactors/settings_interactor.dart';
import 'package:places/data/interactors/filter_interactor.dart';
import 'package:places/ui/screens/select_category_screen/select_category_screen_model.dart';
import 'package:places/data/interactors/search_interactor.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsInteractor(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterInteractor(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlaceInteractor(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchInteractor(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectCategoryScreenModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

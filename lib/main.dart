import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/my_app/my_app.dart';
import 'package:places/ui/screens/sight_search_screen/sight_search_model.dart';
import 'package:places/ui/screens/filter_screen/filters_model.dart';
import 'package:places/ui/screens/select_category_screen/select_category_model.dart';
import 'package:places/ui/screens/splash_screen/splash_model.dart';
import 'package:places/ui/screens/add_sight_screen/add_sight_model.dart';

import 'package:places/data/interactors/place_interactor.dart';

import 'package:places/data/interactors/settings_interactor.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsInteractor(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyFilterModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyCategoriesModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MySearchModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MySplashModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddSightModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlaceInteractor(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

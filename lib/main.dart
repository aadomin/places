import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/my_app/my_app.dart';

import 'package:places/ui/screens/main_screen/my_places_model.dart';
import 'package:places/ui/screens/sight_search_screen/sight_search_model.dart';
import 'ui/screens/filter_screen/filters_model.dart';
import 'ui/screens/select_category_screen/select_category_model.dart';
import 'ui/screens/sight_search_screen/sight_search_model.dart';
import 'ui/screens/main_screen/my_places_model.dart';
import 'ui/screens/splash_screen/splash_model.dart';
import 'ui/my_app/my_app_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyThemeModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyFilterModel(1),
        ),
        ChangeNotifierProvider(
          create: (context) => MyCategoriesModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyPlacesModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MySearchModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MySplashModel(),
        ),
        
      ],
      child: MyApp(),
    ),
  );
}

//TODO: Поднять версию SDK до 2.12.0
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/my_app/my_app.dart';

import 'package:places/ui/interactors/place_interactor.dart';
import 'package:places/ui/interactors/settings_interactor.dart';
import 'package:places/ui/interactors/filter_interactor.dart';
import 'package:places/ui/screens/select_category_screen/select_category_screen_model.dart';
import 'package:places/ui/interactors/search_interactor.dart';

class DI extends StatelessWidget {
  const DI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
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
    );
  }
}
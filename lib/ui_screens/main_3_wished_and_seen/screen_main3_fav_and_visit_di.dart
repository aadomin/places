import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit_vm.dart';

/// Экран 3. DI
///

ScreenMain3FavAndVisit createScreenMain3FavAndVisit(BuildContext context) {
  return ScreenMain3FavAndVisit(
    viewModel: ScreenMain3FavAndVisitVM(
      context: context,
      placesInteractor: context.read<DI>().placesInteractor,
    ),
  );
}

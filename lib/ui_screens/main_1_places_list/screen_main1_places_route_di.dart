// ТУТВОПРОС

import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_route.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_route_vm.dart';
import 'package:provider/provider.dart';

ScreenMain1PlacesRoute createScreenMain1PlacesRoute(BuildContext context) {
  return ScreenMain1PlacesRoute(
    viewModel: ScreenMain1PlacesRouteVM(
      context: context,
      placesInteractor: context.read<DI>().placesInteractor,
    ),
  );
}

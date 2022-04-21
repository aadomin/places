// ТУТВОПРОС

import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_vm.dart';
import 'package:provider/provider.dart';

ScreenMain1Places createScreenMain1Places(BuildContext context) {
  return ScreenMain1Places(
    viewModel: ScreenMain1PlacesVM(
      context: context,
      placesInteractor: context.read<DI>().placesInteractor,
    ),
  );
}

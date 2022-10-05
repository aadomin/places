import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_vm.dart';
import 'package:provider/provider.dart';

/// DI для экрана добавления места
ScreenAddPlace createScreenAddPlace({
  required BuildContext context,
}) {
  return ScreenAddPlace(
    viewModel: ScreenAddPlaceVM(
      context: context,
      placesInteractor: context.watch<DI>().placesInteractor,
      //TODO(me): fuck
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:places/domain_entities/place_entity.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_vm.dart';
import 'package:provider/provider.dart';

ScreenAddPlace createScreenAddPlace({
  required BuildContext context,
}) {
  return ScreenAddPlace(
    viewModel: ScreenAddPlaceVM(
      context: context,
      placesEntity: context.read<PlaceEntity>(),
    ),
  );
}

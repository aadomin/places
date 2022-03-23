import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/ui_screens/popups/popup_manager.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details_vm.dart';
import 'package:provider/provider.dart';

ScreenPlaceDetails createScreenPlaceDetails({
  required BuildContext context,
  required int placeId,
}) {
  return ScreenPlaceDetails(
    viewModel: ScreenPlaceDetailsVM(
      context: context,
      placesInteractor: context.read<PlacesInteractor>(),
      popupManager: context.read<PopupManager>(),
    ),
    placeId: placeId,
  );
}

import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_vm.dart';
import 'package:provider/provider.dart';

/// Поставка зависимостей для главного экрана
class ScreenMain1PlacesDI extends StatelessWidget {
  const ScreenMain1PlacesDI({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenMain1Places(
      viewModel: ScreenMain1PlacesVM(
        context: context,
        placesInteractor: context.read<DI>().placesInteractor,
      ),
    );
  }
}

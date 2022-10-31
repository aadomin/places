import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_vm.dart';
import 'package:provider/provider.dart';

/// DI для экрана добавления места
class ScreenAddPlaceDI extends StatelessWidget {
  const ScreenAddPlaceDI({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenAddPlace(
      viewModel: ScreenAddPlaceVM(
        context: context,
        //TODO(me): убрать watch
        placesInteractor: context.watch<DI>().placesInteractor,
      ),
    );
  }
}

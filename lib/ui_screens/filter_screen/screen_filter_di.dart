import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/filter_screen/screen_filter.dart';
import 'package:places/ui_screens/filter_screen/screen_filter_vm.dart';
import 'package:provider/provider.dart';

class ScreenFilterDI extends StatelessWidget {
  const ScreenFilterDI({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenFilter(
      viewModel: ScreenFilterVM(
        context: context,
        filterInteractor: context.read<DI>().filterInteractor,
        placesInteractor: context.read<DI>().placesInteractor,
      ),
    );
  }
}

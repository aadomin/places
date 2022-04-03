import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/filter_screen/screen_filter.dart';
import 'package:places/ui_screens/filter_screen/screen_filter_vm.dart';
import 'package:provider/provider.dart';

ScreenFilter createScreenFilter({required BuildContext context}) {
  return ScreenFilter(
    viewModel: ScreenFilterVM(
      context: context,
      // ТУТВОПРОС - две ссылки - это норм?
      filterInteractor: context.read<DI>().filterInteractor,
      placesInteractor: context.read<DI>().placesInteractor,
    ),
  );
}

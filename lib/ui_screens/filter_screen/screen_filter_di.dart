import 'package:flutter/material.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/ui_screens/filter_screen/screen_filter.dart';
import 'package:places/ui_screens/filter_screen/screen_filter_vm.dart';
import 'package:provider/provider.dart';

ScreenFilter createScreenFilter({required BuildContext context}) {
  return ScreenFilter(
    viewModel: ScreenFilterVM(
      filterInteractor: context.read<FilterInteractor>(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:places/domain_interactors/search_interactor.dart';
import 'package:places/ui_screens/place_search_screen/screen_search.dart';
import 'package:places/ui_screens/place_search_screen/screen_search_vm.dart';
import 'package:provider/provider.dart';

ScreenSearch createScreenSearch({
  required BuildContext context,
}) {
  return ScreenSearch(
    viewModel: ScreenSearchVM(
      context: context,
      searchInteractor: context.read<SearchInteractor>(),
    ),
  );
}

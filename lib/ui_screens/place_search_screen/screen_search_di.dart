import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/place_search_screen/screen_search.dart';
import 'package:places/ui_screens/place_search_screen/screen_search_vm.dart';
import 'package:provider/provider.dart';

/// DI для экрана поиска
class ScreenSearchDI extends StatelessWidget {
  const ScreenSearchDI({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenSearch(
      viewModel: ScreenSearchVM(
        context: context,
        searchInteractor: context.read<DI>().searchInteractor,
      ),
    );
  }
}

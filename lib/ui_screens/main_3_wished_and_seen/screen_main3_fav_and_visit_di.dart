import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit_vm.dart';
import 'package:provider/provider.dart';

/// Dependencies injection for FavAndVisit page
class ScreenMain3FavAndVisitDI extends StatelessWidget {
  const ScreenMain3FavAndVisitDI({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenMain3FavAndVisit(
      viewModel: ScreenMain3FavAndVisitVM(
        context: context,
        placesInteractor: context.read<DI>().placesInteractor,
      ),
    );
  }
}

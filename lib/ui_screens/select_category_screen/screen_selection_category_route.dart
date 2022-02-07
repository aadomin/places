import 'package:flutter/material.dart';
import 'package:places/ui_interactors/selection_category_interactor.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category.dart';
import 'package:provider/provider.dart';

class ScreenSelectionCategoryRoute extends StatefulWidget {
  const ScreenSelectionCategoryRoute({Key? key}) : super(key: key);

  @override
  _ScreenSelectionCategoryRouteState createState() =>
      _ScreenSelectionCategoryRouteState();
}

class _ScreenSelectionCategoryRouteState
    extends State<ScreenSelectionCategoryRoute> {
  @override
  Widget build(BuildContext context) {
    final _selectedCategory =
        ModalRoute.of(context)?.settings.arguments as String;
    return ChangeNotifierProvider(
      create: (context) => SelectionCategoryInteractor(
        selectedCategory: _selectedCategory,
        // тут вопрос
        // selectedCategory: ModalRoute.of(context)?.settings.arguments as String,
      ),
      child: const ScreenSelectionCategory(),
    );
  }
}

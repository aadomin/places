import 'package:flutter/material.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category_vm.dart';
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
      create: (context) => SelectionCategoryVM(
        selectedCategory: _selectedCategory,
      ),
      child: const ScreenSelectionCategory(),
    );
  }
}

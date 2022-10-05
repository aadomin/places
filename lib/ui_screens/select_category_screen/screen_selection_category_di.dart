import 'package:flutter/material.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category_vm.dart';
import 'package:provider/provider.dart';

class ScreenSelectionCategoryDi extends StatefulWidget {
  const ScreenSelectionCategoryDi({Key? key}) : super(key: key);

  @override
  _ScreenSelectionCategoryDiState createState() =>
      _ScreenSelectionCategoryDiState();
}

class _ScreenSelectionCategoryDiState
    extends State<ScreenSelectionCategoryDi> {
  @override
  Widget build(BuildContext context) {
    final _selectedCategory =
        ModalRoute.of(context)?.settings.arguments as String;
    return ChangeNotifierProvider(
      create: (context) => ScreenSelectionCategoryVM(
        selectedCategory: _selectedCategory,
      )..init(),
      child: const ScreenSelectionCategory(),
    );
  }
}

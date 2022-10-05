import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category_vm.dart';
import 'package:provider/provider.dart';

/// Экран "Выбор категории"
class ScreenSelectionCategory extends StatefulWidget {
  const ScreenSelectionCategory({Key? key}) : super(key: key);

  @override
  State<ScreenSelectionCategory> createState() =>
      _ScreenSelectionCategoryState();
}

class _ScreenSelectionCategoryState extends State<ScreenSelectionCategory> {
  @override
  void initState() {
    super.initState();
    // ТУТВОПРОС потому что не помню почему watch
    context.read<ScreenSelectionCategoryVM>().init();
  }

  @override
  Widget build(BuildContext context) {
    final _categories =
        context.watch<ScreenSelectionCategoryVM>().allCategories;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColorLight,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.keyboard_arrow_left),
                ),
              ),
            ),
            Text(
              UiStrings.selectionCategory,
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Expanded(
              child: Text(''),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _categories.asMap().entries.map((item) {
              return ListTile(
                onTap: () {
                  context
                      .read<ScreenSelectionCategoryVM>()
                      .toggleSelectedCategory(item.value.name);
                },
                title: Text(item.value.name),
                trailing: item.value.isSelected
                    ? Icon(Icons.done,
                        color: Theme.of(context).colorScheme.secondary)
                    : const Text(''),
              );
            }).toList(),
          ),
        ),
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ElevatedButton(
            onPressed: () {
              final _selectedCategory =
                  context.read<ScreenSelectionCategoryVM>().selectedCategory;
              Navigator.pop(context, _selectedCategory);
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(UiStrings.saveCaps),
            ),
          ),
        ),
      ),
    );
  }
}

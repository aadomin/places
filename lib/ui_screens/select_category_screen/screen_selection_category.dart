import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category_vm.dart';

/// Экран "Выбор категории"
class ScreenSelectionCategory extends StatefulWidget {
  const ScreenSelectionCategory({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final ScreenSelectionCategoryVM viewModel;

  @override
  State<ScreenSelectionCategory> createState() =>
      _ScreenSelectionCategoryState();
}

class _ScreenSelectionCategoryState extends State<ScreenSelectionCategory> {
  ScreenSelectionCategoryVM get ___vm => widget.viewModel;

  @override
  void initState() {
    super.initState();
    ___vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => ___vm.onCancel(),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColorLight,
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
            children: ___vm.allCategories.asMap().entries.map((item) {
              return ListTile(
                onTap: () => ___vm.onToggleSelectedCategory(item.value.name),
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
            onPressed: () => ___vm.onSave(),
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

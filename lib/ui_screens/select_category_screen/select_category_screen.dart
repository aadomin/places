import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:provider/provider.dart';
import 'package:places/ui_interactors/select_category_interactor.dart';

/// Экран "Выбор категории"
class SelectCategory extends StatelessWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _categories = context.watch<SelectCategoryInteractor>().myCategories;

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
                      .read<SelectCategoryInteractor>()
                      .switchCategoryCheck(item.key);
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
      bottomSheet: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
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

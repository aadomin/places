import 'package:flutter/material.dart';
import 'package:places/ui/screens/select_category_screen/select_category_model.dart';
import 'package:provider/provider.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _categories = context.watch<MyCategoriesModel>().myCategories;

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
              'Выбор категории',
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
                      .read<MyCategoriesModel>()
                      .switchCategoryCheck(item.key);
                },
                title: Text(item.value.name),
                trailing: item.value.isSelected
                    ? Icon(Icons.done, color: Theme.of(context).accentColor)
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
              child: Text('СОХРАНИТЬ'),
            ),
          ),
        ),
      ),
    );
  }
}

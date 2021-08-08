import 'package:flutter/material.dart';
import 'package:places/ui/screens/select_category_screen/select_category_model.dart';
import 'package:provider/provider.dart';

class SelectCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _categories = context.watch<MyCategoriesModel>().myCategories;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title: Row(
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.keyboard_arrow_left),
                ),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColorLight,
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
            Expanded(
              flex: 1,
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
              var _i = item.key;
              var _name = item.value.name;
              var _isSelected = item.value.isSelected;
              return ListTile(
                onTap: () {
                  context.read<MyCategoriesModel>().switchCategoryCheck(_i);
                },
                title: Text(_name),
                trailing: _isSelected
                    ? Icon(Icons.done,
                        color: Theme.of(context).accentColor)
                    : Text(''),
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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('СОХРАНИТЬ'),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/models/ui_categories_model.dart';
import '../models/my_places_model.dart';

class AddSightScreen extends StatelessWidget {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    var _currentlySelectedCategory =
        context.watch<MyCategoriesModel>().currentlySelected;

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
                  child: Text(
                    'Отмена',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            Text(
              'Новое место',
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
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryNameWidget('КАТЕГОРИЯ'),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/select_category');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                        child: Text(_currentlySelectedCategory),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('>'),
                    ),
                  ],
                ),
              ),
              CategoryNameWidget('НАЗВАНИЕ'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextField(
                  focusNode: focusNode1,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    hintText: 'Введите название',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryNameWidget('ШИРОТА'),
                        TextField(
                          focusNode: focusNode2,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: 1,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          decoration: InputDecoration(
                            hintText: 'Введите широту',
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10, height: 10),
                  Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryNameWidget('ДОЛГОТА'),
                        TextField(
                          focusNode: focusNode3,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: 1,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          decoration: InputDecoration(
                            hintText: 'Введите долготу',
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Указать на карте',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16,
                  ),
                ),
              ),
              CategoryNameWidget('ОПИСАНИЕ'),
              TextField(
                focusNode: focusNode4,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                decoration: InputDecoration(
                  hintText: 'Введите текст',
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ElevatedButton(
            onPressed: () {
              context.read<MyPlacesModel>().save();
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('СОХРАНИТЬ2'),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryNameWidget extends StatelessWidget {
  String categoryName = '';
  CategoryNameWidget(
    this.categoryName, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 12),
      child: Text(
        categoryName,
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}

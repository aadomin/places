import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:places/ui/models/ui_categories_model.dart';
import '../models/my_places_model.dart';
import '../../routes.dart';
import 'dart:io';

class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodeLat = FocusNode();
  FocusNode focusNodeLon = FocusNode();
  FocusNode focusNodeDescription = FocusNode();

  final textControllerName = TextEditingController();
  final textControllerLat = TextEditingController();
  final textControllerLon = TextEditingController();
  final textControllerDescription = TextEditingController();

  List<int> _listOfPhotos = [0, 1, 2, 3, 4, 5];

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
              SizedBox(
                height: 75,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Theme.of(context).canvasColor,
                        ),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Icon(Icons.add,
                                size: 30, color: Theme.of(context).accentColor),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: Platform.isAndroid
                        ? ClampingScrollPhysics()
                        : BouncingScrollPhysics(),
                        children: _listOfPhotos.asMap().entries.map((item) {
                          return Dismissible(
                            background: Container(
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(right: 16),
                              child: Center(
                                child: Icon(
                                  Icons.restore_from_trash,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            key: ObjectKey(item),
                            direction: DismissDirection.vertical,
                            onDismissed: (direction) {},
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _listOfPhotos.removeAt(item.key);
                                });
                                print(_listOfPhotos.toString());
                              },
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: SizedBox(
                                      width: 72,
                                      height: 72,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(13),
                                          child: Image.network(
                                            'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 12, right: 24),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    child: Icon(Icons.close,
                                        size: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              CategoryNameWidget('КАТЕГОРИЯ'),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ROUTE_SELECT_CATEGORY);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
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
                  focusNode: focusNodeName,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  controller: textControllerName,
                  onSubmitted: (String value) {
                    focusNodeLat.requestFocus();
                  },
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
                          controller: textControllerLat,
                          focusNode: focusNodeLat,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: 1,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          onSubmitted: (String value) {
                            focusNodeLon.requestFocus();
                          },
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
                          controller: textControllerLon,
                          focusNode: focusNodeLon,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: 1,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          onSubmitted: (String value) {
                            focusNodeDescription.requestFocus();
                          },
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
                controller: textControllerDescription,
                focusNode: focusNodeDescription,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                onSubmitted: (String value) {
                  focusNodeDescription.unfocus();
                },
                decoration: InputDecoration(
                  hintText: 'Введите текст',
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
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
              context.read<MyPlacesModel>().save(
                    name: textControllerName.text,
                    lat: double.parse(textControllerLat.text),
                    lon: double.parse(textControllerLon.text),
                    url: 'исправить',
                    details: textControllerDescription.text,
                    type: context.read<MyCategoriesModel>().currentlySelected,
                  );
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('СОЗДАТЬ'),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryNameWidget extends StatelessWidget {
  final String categoryName;
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

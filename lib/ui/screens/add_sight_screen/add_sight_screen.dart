import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:places/ui/screens/select_category_screen/select_category_model.dart';
import 'package:places/ui/screens/main_screen/my_places_model.dart';
import 'package:places/ui/my_app/routes.dart';
import 'package:places/ui/my_scroll_physics.dart';
import 'package:places/ui/widgets/MyImageWidget.dart';
import 'widget_category_header.dart';
import 'dialog_add_photo.dart';
import 'add_sight_model.dart';

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

  //+
  List<String> _listOfPhotos = [];

  @override
  Widget build(BuildContext context) {
    //+
    _listOfPhotos = context.watch<AddSightModel>().listOfPhotos;

    //+
    var _currentlySelectedCategory =
        context.watch<MyCategoriesModel>().currentlySelected;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title: Row(
          children: [
            //
            // Кнопка Назад
            //
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
                ],
              ),
            ),
            //
            // Заголовок
            //
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
              child: SizedBox.shrink(),
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
                    //
                    // Кнопка +
                    //
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: InkWell(
                        onTap: () {
                          onTapOnPlus();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Theme.of(context).accentColor,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Theme.of(context).canvasColor,
                            ),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Icon(Icons.add,
                                    size: 30,
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //
                    // Добавленные фотки
                    //
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: MyScrollPhysics.physics,
                        children: _listOfPhotos.asMap().entries.map((item) {
                          return Dismissible(
                            background: Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(right: 16),
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
                            onDismissed: (_) =>
                                onDismissPhoto(_listOfPhotos, item.key),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 16),
                                  child: SizedBox(
                                    width: 72,
                                    height: 72,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(13),
                                        child: MyImageWidget(
                                          url: item.value,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 12, right: 24),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      onTapOnDelete(_listOfPhotos, item.key);
                                    },
                                    child: Icon(Icons.close,
                                        size: 16, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              CategoryHeaderWidget('КАТЕГОРИЯ'),
              InkWell(
                onTap: () => onTapOnCategorySelection(context),
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
              CategoryHeaderWidget('НАЗВАНИЕ'),
              Padding(
                padding: const EdgeInsets.all(0),
                child: TextField(
                  controller: textControllerName,
                  focusNode: focusNodeName,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 1,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
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
                        CategoryHeaderWidget('ШИРОТА'),
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
                        CategoryHeaderWidget('ДОЛГОТА'),
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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Показываем карту'),
                    ),
                  );
                },
                child: Text(
                  'Указать на карте',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16,
                  ),
                ),
              ),
              CategoryHeaderWidget('ОПИСАНИЕ'),
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
        //
        // Кнопка СОЗДАТЬ
        //
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ElevatedButton(
            onPressed: () {
              onTapOnSave(context);
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

  void onTapOnPlus() {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      builder: (_) => DialogAddPhoto(),
    );
  }

  void onTapOnDelete(List<String> _listOfPhotos, int index) {
    return setState(() {
      _listOfPhotos.removeAt(index);
    });
  }

  void onDismissPhoto(List<String> _listOfPhotos, int index) {
    return setState(() {
      _listOfPhotos.removeAt(index);
    });
  }

  void onTapOnCategorySelection(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_SELECT_CATEGORY);
  }

  void onTapOnSave(BuildContext context) {
    context.read<MyPlacesModel>().save(
          name: textControllerName.text,
          lat: double.parse(textControllerLat.text),
          lon: double.parse(textControllerLon.text),
          url: 'исправить',
          details: textControllerDescription.text,
          type: context.read<MyCategoriesModel>().currentlySelected,
          wished: false,
        );
    Navigator.pop(context);
  }
}

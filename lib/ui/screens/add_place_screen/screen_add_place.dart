import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui/screens/add_place_screen/widget_new_place_app_bar.dart';
import 'package:places/ui_common_widgets/widget_bottom_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:places/ui_commons/my_scroll_physics.dart';
import 'package:places/ui/screens/add_place_screen/widget_small_category_header.dart';
import 'package:places/ui/screens/add_place_screen/dialog_add_photo.dart';
import 'package:places/ui_interactors/select_category_interactor.dart';
import 'package:places/ui_common_widgets/widget_my_image.dart';
import 'package:places/ui_interactors/place_interactor.dart';

/// Экран - Добавить место
class ScreenAddPlace extends StatefulWidget {
  const ScreenAddPlace({Key? key}) : super(key: key);
  @override
  _ScreenAddPlaceState createState() => _ScreenAddPlaceState();
}

class _ScreenAddPlaceState extends State<ScreenAddPlace> {
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

  final formAddPlaceKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //+
    _listOfPhotos = context.watch<PlaceInteractor>().listOfPhotos;

    //+
    final _currentlySelectedCategory =
        context.watch<SelectCategoryInteractor>().currentlySelected;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title: const WidgetNewPlaceAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Form(
            key: formAddPlaceKey,
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
                          onTap: onTapOnPlus,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Theme.of(context).colorScheme.secondary,
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
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
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
                                child: const Center(
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
                                        child: WidgetMyImage(
                                          url: item.value,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 12, right: 24),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Theme.of(context).canvasColor,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        onTapOnDelete(_listOfPhotos, item.key);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        size: 16,
                                        color: Colors.black,
                                      ),
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
                const WidgetSmallCategoryHeader('КАТЕГОРИЯ'),
                InkWell(
                  onTap: () => onTapOnCategorySelection(context),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                          child: Text(_currentlySelectedCategory),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text('>'),
                      ),
                    ],
                  ),
                ),
                const WidgetSmallCategoryHeader('НАЗВАНИЕ'),
                Padding(
                  padding: EdgeInsets.zero,
                  child: TextFormField(
                    controller: textControllerName,
                    focusNode: focusNodeName,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 1, // ignore: avoid_redundant_argument_values
                    maxLengthEnforcement: MaxLengthEnforcement.none,
                    onFieldSubmitted: (String value) {
                      focusNodeLat.requestFocus();
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
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
                          const WidgetSmallCategoryHeader('ШИРОТА'),
                          TextFormField(
                            controller: textControllerLat,
                            validator: (value) {
                              final String text = value ?? '';
                              final _coordinatesExp =
                                  RegExp(r'^-?[0-9]{1,3}(?:\.[0-9]{1,20})?$');
                              if (!_coordinatesExp.hasMatch(text) ||
                                  text.isEmpty) {
                                return 'Некорректный ввод';
                              }
                              return null;
                            },
                            focusNode: focusNodeLat,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.sentences,
                            // ignore: avoid_redundant_argument_values
                            maxLines: 1,
                            maxLengthEnforcement: MaxLengthEnforcement.none,

                            onFieldSubmitted: (String value) {
                              focusNodeLon.requestFocus();
                            },
                            decoration: const InputDecoration(
                              hintText: 'Введите широту',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10, height: 10),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const WidgetSmallCategoryHeader('ДОЛГОТА'),
                          TextFormField(
                            controller: textControllerLon,
                            validator: (value) {
                              final String text = value ?? '';
                              final _coordinatesExp =
                                  RegExp(r'^-?[0-9]{1,3}(?:\.[0-9]{1,20})?$');
                              if (!_coordinatesExp.hasMatch(text) ||
                                  text.isEmpty) {
                                return 'Некорректный ввод';
                              }
                              return null;
                            },
                            focusNode: focusNodeLon,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.sentences,
                            // ignore: avoid_redundant_argument_values
                            maxLines: 1,
                            maxLengthEnforcement: MaxLengthEnforcement.none,
                            onFieldSubmitted: (String value) {
                              focusNodeDescription.requestFocus();
                            },
                            decoration: const InputDecoration(
                              hintText: 'Введите долготу',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
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
                      const SnackBar(
                        content: Text('Показываем карту'),
                      ),
                    );
                  },
                  child: Text(
                    'Указать на карте',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                ),
                const WidgetSmallCategoryHeader('ОПИСАНИЕ'),
                TextFormField(
                  controller: textControllerDescription,
                  focusNode: focusNodeDescription,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  onFieldSubmitted: (String value) {
                    focusNodeDescription.unfocus();
                  },
                  decoration: const InputDecoration(
                    hintText: 'Введите текст',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: WidgetBottomButton(
        onPressOnButton: onTapOnSave,
        buttonName: 'СОЗДАТЬ',
      ),
    );
  }

  void onTapOnPlus() {
    showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => const DialogAddPhoto(),
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

  void onTapOnSave() {
    if (formAddPlaceKey.currentState?.validate() ?? false) {
      context.read<PlaceInteractor>().addNewPlace(
            name: textControllerName.text,
            lat: double.parse(textControllerLat.text),
            lon: double.parse(textControllerLon.text),
            // TODO(me): добавить url к создаваемому месту
            url: 'исправить',
            details: textControllerDescription.text,
            type: context.read<SelectCategoryInteractor>().currentlySelected,
          );
      Navigator.pop(context);
    }
  }
}

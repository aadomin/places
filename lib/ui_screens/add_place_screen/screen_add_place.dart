import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_screens/add_place_screen/widget_new_place_app_bar.dart';
import 'package:places/ui_widgets_commons/widget_bottom_button.dart';
import 'package:places/ui_widgets_commons/widget_textfield_clear_button.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:places/ui_commons/my_scroll_physics.dart';
import 'package:places/ui_screens/add_place_screen/widget_small_category_header.dart';
import 'package:places/ui_screens/add_place_screen/dialog_add_photo.dart';
import 'package:places/ui_widgets_commons/widget_my_image.dart';
import 'package:places/domain_entities/place_entity.dart';

///
/// Экран - Добавить место
///
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

  final keyFormAddPlace = GlobalKey<FormState>();

  bool isButtonSaveActive = false;

  String _currentlySelectedCategory = UiStrings.notSelected;

  @override
  Widget build(BuildContext context) {
    //+
    _listOfPhotos = context.watch<PlaceEntity>().listOfPhotos;

    //+

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
            key: keyFormAddPlace,
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
                //
                // КАТЕГОРИЯ
                //
                const WidgetSmallCategoryHeader(UiStrings.addPlaceCategory),
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
                //
                // Поле ввода НАЗВАНИЕ
                //
                const WidgetSmallCategoryHeader(UiStrings.addPlaceName),
                Padding(
                  padding: EdgeInsets.zero,
                  child: TextFormField(
                    controller: textControllerName,
                    validator: (value) {
                      final String text = value ?? '';
                      final _nameExp = RegExp(r'^.{1,}$');
                      if (!_nameExp.hasMatch(text) || text.isEmpty) {
                        return UiStrings.addPlaceUncorrectInput;
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      // ignore: unnecessary_lambdas
                      setState(() {
                        activateButtonIfDone();
                      });
                    },
                    focusNode: focusNodeName,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 1, // ignore: avoid_redundant_argument_values
                    maxLengthEnforcement: MaxLengthEnforcement.none,
                    onFieldSubmitted: (String value) {
                      focusNodeLat.requestFocus();
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      hintText: UiStrings.addPlaceNameHint,
                      border: const OutlineInputBorder(),
                      suffixIcon: WidgetTextFieldClearButton(
                        showOnlyItHasThatFocus: focusNodeName.hasFocus,
                        textController: textControllerName,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    //
                    // Поле ввода ШИРОТА
                    //
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const WidgetSmallCategoryHeader(
                              UiStrings.addPlaceLat),
                          TextFormField(
                            controller: textControllerLat,
                            validator: (value) {
                              final String text = value ?? '';
                              final _coordinatesExp =
                                  RegExp(r'^-?[0-9]{1,3}(?:\.[0-9]{1,20})?$');
                              if (!_coordinatesExp.hasMatch(text) ||
                                  text.isEmpty) {
                                return UiStrings.addPlaceUncorrectInput;
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              setState(() {
                                activateButtonIfDone();
                              });
                            },
                            focusNode: focusNodeLat,
                            keyboardType: PlatformDetector.isIOS
                                ? TextInputType.text
                                : TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.sentences,
                            // ignore: avoid_redundant_argument_values
                            maxLines: 1,
                            maxLengthEnforcement: MaxLengthEnforcement.none,

                            onFieldSubmitted: (String value) {
                              focusNodeLon.requestFocus();
                            },
                            decoration: InputDecoration(
                              hintText: UiStrings.addPlaceLatHint,
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              suffixIcon: WidgetTextFieldClearButton(
                                showOnlyItHasThatFocus: focusNodeLat.hasFocus,
                                textController: textControllerLat,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10, height: 10),

                    //
                    // Поле ввода ДОЛГОТА
                    //
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const WidgetSmallCategoryHeader(
                              UiStrings.addPlaceLon),
                          TextFormField(
                            controller: textControllerLon,
                            validator: (value) {
                              final String text = value ?? '';
                              final _coordinatesExp =
                                  RegExp(r'^-?[0-9]{1,3}(?:\.[0-9]{1,20})?$');
                              if (!_coordinatesExp.hasMatch(text) ||
                                  text.isEmpty) {
                                return UiStrings.addPlaceUncorrectInput;
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              setState(() {
                                activateButtonIfDone();
                              });
                            },
                            focusNode: focusNodeLon,
                            keyboardType: PlatformDetector.isIOS
                                ? TextInputType.text
                                : TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.sentences,
                            // ignore: avoid_redundant_argument_values
                            maxLines: 1,
                            maxLengthEnforcement: MaxLengthEnforcement.none,
                            onFieldSubmitted: (String value) {
                              focusNodeDescription.requestFocus();
                            },
                            decoration: InputDecoration(
                              hintText: UiStrings.addPlaceLonHint,
                              border: const OutlineInputBorder(),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              suffixIcon: WidgetTextFieldClearButton(
                                showOnlyItHasThatFocus: focusNodeLon.hasFocus,
                                textController: textControllerLon,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //
                // Кнопка УКАЗАТЬ НА КАРТЕ
                //
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(UiStrings.addPlaceShowing),
                      ),
                    );
                  },
                  child: Text(
                    UiStrings.addPlaceShowMap,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                ),

                //
                // Поле ОПИСАНИЕ
                //
                const WidgetSmallCategoryHeader(UiStrings.addPlaceDescription),
                TextFormField(
                  controller: textControllerDescription,
                  validator: (value) {
                    final String text = value ?? '';
                    final _nameExp = RegExp(r'^.{1,}$');
                    if (!_nameExp.hasMatch(text) || text.isEmpty) {
                      return UiStrings.addPlaceUncorrectInput;
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    setState(() {
                      activateButtonIfDone();
                    });
                  },
                  focusNode: focusNodeDescription,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  maxLengthEnforcement: MaxLengthEnforcement.none,
                  onFieldSubmitted: (String value) {
                    focusNodeDescription.unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: UiStrings.addPlaceDescriptionHint,
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10,
                    ),
                    suffixIcon: WidgetTextFieldClearButton(
                      showOnlyItHasThatFocus: focusNodeDescription.hasFocus,
                      textController: textControllerDescription,
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
        isActive: isButtonSaveActive,
        onPressOnButton: onTapOnSave,
        buttonName: UiStrings.addPlaceAddPlace,
      ),
    );
  }

  void activateButtonIfDone() {
    final bool allFieldsFilled = (textControllerName.text != '') &&
        (textControllerLon.text != '') &&
        (textControllerLat.text != '') &&
        (textControllerDescription.text != '');
    if (allFieldsFilled) {
      final bool isFormValid =
          keyFormAddPlace.currentState?.validate() ?? false;
      isButtonSaveActive = isFormValid;
    }
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

  Future<void> onTapOnCategorySelection(BuildContext context) async {
    _currentlySelectedCategory = await Navigator.of(context).pushNamed(
        ROUTE_SELECT_CATEGORY,
        arguments: _currentlySelectedCategory) as String;
    // тут вопрос (async)
    setState(() {});

    // тут вопрос
    // _currentlySelectedCategory = context.watch<SelectionCategoryInteractor>().selectedCategory;
  }

  void onTapOnSave() {
    if (keyFormAddPlace.currentState?.validate() ?? false) {
      context.read<PlaceEntity>().addNewPlace(
            name: textControllerName.text,
            lat: double.parse(textControllerLat.text),
            lon: double.parse(textControllerLon.text),
            // TODO(me): добавить url к создаваемому месту
            url: 'исправить',
            details: textControllerDescription.text,
            type: _currentlySelectedCategory,
          );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(UiStrings.newPlaceCreated)),
      );
      Navigator.pop(context);
    }
  }
}

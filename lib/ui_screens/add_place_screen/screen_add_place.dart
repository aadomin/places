import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/ui_commons/my_scroll_physics.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_commons/validator_for.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_vm.dart';
import 'package:places/ui_screens/add_place_screen/widget_new_place_app_bar.dart';
import 'package:places/ui_screens/add_place_screen/widget_small_category_header.dart';
import 'package:places/ui_widgets_commons/widget_bottom_button.dart';
import 'package:places/ui_widgets_commons/widget_my_image.dart';
import 'package:places/ui_widgets_commons/widget_textfield_clear_button.dart';

/// Экран - Добавить место
///
class ScreenAddPlace extends StatefulWidget {
  const ScreenAddPlace({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final ScreenAddPlaceVM viewModel;
  @override
  _ScreenAddPlaceState createState() => _ScreenAddPlaceState();
}

class _ScreenAddPlaceState extends State<ScreenAddPlace> {
  ScreenAddPlaceVM get ___viewModel => widget.viewModel;

  @override
  void initState() {
    widget.viewModel.addListener(_vmListener);
    widget.viewModel.initVM();
    super.initState();
  }

  void _vmListener() => setState(() {});

  @override
  void dispose() {
    widget.viewModel.disposeVM();
    widget.viewModel.removeListener(_vmListener);
    super.dispose();
  }

  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodeLat = FocusNode();
  FocusNode focusNodeLon = FocusNode();
  FocusNode focusNodeDescription = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        title: WidgetNewPlaceAppBar(
          onCancel: ___viewModel.onCancelOnAppbar,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Form(
            key: ___viewModel.keyFormAddPlace,
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
                          onTap: ___viewModel.onTapOnPlus,
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
                          children: ___viewModel.listOfPhotos
                              .asMap()
                              .entries
                              .map((item) {
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
                                  ___viewModel.onDismissPhoto(item.key),
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
                                        ___viewModel.onDeletePhoto(item.key);
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
                  onTap: () => ___viewModel.onTapOnCategorySelection(context),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                          child: Text(___viewModel.currentlySelectedCategory),
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
                    controller: ___viewModel.textControllerName,
                    validator: ValidatorFor.nameOfPlace,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      ___viewModel.activateButtonSaveIfPossible();
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
                        textController: ___viewModel.textControllerName,
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
                            controller: ___viewModel.textControllerLat,
                            validator: ValidatorFor.longitudeOrLatit,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ___viewModel.activateButtonSaveIfPossible();
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
                                textController: ___viewModel.textControllerLat,
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
                            controller: ___viewModel.textControllerLon,
                            validator: ValidatorFor.longitudeOrLatit,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              ___viewModel.activateButtonSaveIfPossible();
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
                                textController: ___viewModel.textControllerLon,
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
                  onPressed: ___viewModel.onShowTheMap,
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
                  controller: ___viewModel.textControllerDescription,
                  validator: ValidatorFor.descriptionOfPlace,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    ___viewModel.activateButtonSaveIfPossible();
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
                      textController: ___viewModel.textControllerDescription,
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
        isActive: ___viewModel.isButtonSaveActive,
        onPressOnButton: () {
          ___viewModel.onTapOnSave();
        },
        buttonName: UiStrings.addPlaceAddPlace,
      ),
    );
  }
}

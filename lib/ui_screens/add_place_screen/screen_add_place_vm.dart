import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/add_place_screen/dialog_add_photo.dart';

/// VM экрана Добавить место
class ScreenAddPlaceVM with ChangeNotifier {
  ScreenAddPlaceVM({
    required this.context,
    required this.placesInteractor,
  });

  BuildContext context;
  final PlacesInteractor placesInteractor;

  void initVM() {}

  void disposeVM() {}
  //

  final textControllerName = TextEditingController();
  final textControllerLat = TextEditingController();
  final textControllerLon = TextEditingController();
  final textControllerDescription = TextEditingController();

  final keyFormAddPlace = GlobalKey<FormState>();

  String currentlySelectedCategory = UiStrings.notSelected;

  ///
  /// Добавление нового: перечень фоток
  ///
  List<String>? _listOfPhotos;

  // TODO(me): убрать listOfInitialPhotosForAdding
  ///
  /// Список изначальных фоток
  ///
  static const List<String> listOfInitialPhotosForAdding = [
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
  ];

  ///
  /// Добавление нового: перечень фоток
  ///
  List<String> get listOfPhotos {
    // копируем изначальный список фоток, пока для красоты
    _listOfPhotos ??= [
      ...listOfInitialPhotosForAdding,
    ];
    return _listOfPhotos ?? []; // just for null safety
  }

  ///
  /// Добавление нового: перечень фоток
  ///
  set listOfPhotos(List<String> value) {
    _listOfPhotos = value;
  }

  Future<void> onTapOnSave() async {
    if (keyFormAddPlace.currentState?.validate() ?? false) {
      await placesInteractor.addNewPlace(
        name: textControllerName.text,
        lat: double.parse(textControllerLat.text),
        lon: double.parse(textControllerLon.text),
        // TODO(me): добавить url к создаваемому месту
        url: 'исправить',
        details: textControllerDescription.text,
        type: currentlySelectedCategory,
      );
      // TODO(me): тут так ли - мифическая ошибка
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(UiStrings.newPlaceCreated)),
      );
      Navigator.pop(context);
    }
  }

  void onDeletePhoto(int index) {
    listOfPhotos.removeAt(index);
    notifyListeners();
  }

  void onDismissPhoto(int index) {
    listOfPhotos.removeAt(index);
    notifyListeners();
  }

  void onTapOnPlus() {
    showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => const DialogAddPhoto(),
    );
  }

  void onCancelOnAppbar() {
    Navigator.of(context).pop();
  }

  bool isButtonSaveActive = false;

  void activateButtonSaveIfPossible() {
    final bool allFieldsFilled = (textControllerName.text != '') &&
        (textControllerLon.text != '') &&
        (textControllerLat.text != '') &&
        (textControllerDescription.text != '');
    if (allFieldsFilled) {
      final bool isFormValid =
          keyFormAddPlace.currentState?.validate() ?? false;
      isButtonSaveActive = isFormValid;
      notifyListeners();
    }
    // TODO(me): тут еще исправить
  }

  Future<void> onTapOnCategorySelection(BuildContext context) async {
    currentlySelectedCategory = await Navigator.of(context).pushNamed(
        ROUTE_SELECT_CATEGORY,
        arguments: currentlySelectedCategory) as String;
    notifyListeners();
  }

  void onShowTheMap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(UiStrings.addPlaceShowing),
      ),
    );
  }
}

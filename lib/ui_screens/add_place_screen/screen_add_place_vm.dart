import 'package:flutter/material.dart';
import 'package:places/domain_interactors/places_interactor.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/add_place_screen/dialog_add_photo.dart';

/// Add Place ViewModel
class ScreenAddPlaceVM with ChangeNotifier {
  ScreenAddPlaceVM({
    required this.context,
    required this.placesInteractor,
  });

  final PlacesInteractor placesInteractor;
  BuildContext context;

  void initVM() {}

  void disposeVM() {}
  //

  final textControllerName = TextEditingController();
  final textControllerLat = TextEditingController();
  final textControllerLon = TextEditingController();
  final textControllerDescription = TextEditingController();

  //TODO(me): del global key
  final keyFormAddPlace = GlobalKey<FormState>();

  String currentlySelectedCategory = UiStrings.notSelected;

  List<String> listOfPhotos = [];

  bool isButtonSaveActive = false;

  Future<void> onTapOnSave() async {
    if (keyFormAddPlace.currentState?.validate() ?? false) {
      try {
        await placesInteractor.addNewPlace(
          name: textControllerName.text,
          lat: double.parse(textControllerLat.text),
          lon: double.parse(textControllerLon.text),
          // TODO(me): добавить url к создаваемому месту
          url: 'исправить',
          details: textControllerDescription.text,
          type: currentlySelectedCategory,
        );
        Navigator.pop<bool>(context, true);
      } catch (e) {
        debugPrint(e.toString());
        Navigator.pop<bool>(context, false);
      }
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
      builder: (_) => DialogAddPhoto(
        onCancel: () => Navigator.of(context).pop(),
        onSelectFile: () => Navigator.of(context).pop(),
        onSelectImage: () => Navigator.of(context).pop(),
        onTakePhoto: () => Navigator.of(context).pop(),
      ),
    );
  }

  void onCancelOnAppbar() => Navigator.of(context).pop();

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
    // TODO(me): тут можно лучше?
  }

  Future<void> onTapOnCategorySelection(BuildContext context) async {
    currentlySelectedCategory = await Navigator.of(context).pushNamed(
        appRouteSelectCategory,
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

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_model.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_state.dart';
import 'package:places/ui_screens/add_place_screen/widgets/dialog_add_photo.dart';

abstract class IScreenAddPlaceVm extends IWidgetModel {
  TextEditingController textControllerName = TextEditingController();
  TextEditingController textControllerLat = TextEditingController();
  TextEditingController textControllerLon = TextEditingController();
  TextEditingController textControllerDescription = TextEditingController();

  GlobalKey<FormState> keyFormAddPlace = GlobalKey<FormState>();

  ListenableState<EntityState<ScreenAddPlaceState?>> get screenAddPlaceState;

  Future<void> onTapOnSave();

  void onDeletePhoto(int index);

  void onDismissPhoto(int index);

  void onTapOnPlus();

  void onCancelOnAppbar();

  void activateButtonSaveIfPossible();

  Future<void> onTapOnCategorySelection(BuildContext context);

  void onShowTheMap();
}

ScreenAddPlaceVm createScreenAddPlaceVm(BuildContext _) => ScreenAddPlaceVm(
      ScreenAddPlaceModel(
        placesInteractorG,
      ),
    );

/// Add Place ViewModel
class ScreenAddPlaceVm extends WidgetModel<ScreenAddPlace, ScreenAddPlaceModel>
    implements IScreenAddPlaceVm {
  ScreenAddPlaceVm(ScreenAddPlaceModel model) : super(model) {
    _screenAddPlaceState = EntityStateNotifier(
      const EntityState(
        data: ScreenAddPlaceState(
          listOfPhotos: [],
          isButtonSaveActive: false,
          currentlySelectedCategory: UiStrings.notSelected,
        ),
      ),
    );
    _screenAddPlaceState.content(
      const ScreenAddPlaceState(
        listOfPhotos: [],
        isButtonSaveActive: false,
        currentlySelectedCategory: UiStrings.notSelected,
      ),
    );
  }

  TextEditingController textControllerName = TextEditingController();
  TextEditingController textControllerLat = TextEditingController();
  TextEditingController textControllerLon = TextEditingController();
  TextEditingController textControllerDescription = TextEditingController();

  //TODO(me): del global key
  GlobalKey<FormState> keyFormAddPlace = GlobalKey<FormState>();

  late EntityStateNotifier<ScreenAddPlaceState> _screenAddPlaceState =
      EntityStateNotifier(null);

  @override
  ListenableState<EntityState<ScreenAddPlaceState?>> get screenAddPlaceState =>
      _screenAddPlaceState;

  Future<void> onTapOnSave() async {
    if (keyFormAddPlace.currentState?.validate() ?? false) {
      try {
        await model.addNewPlace(
          name: textControllerName.text,
          lat: double.parse(textControllerLat.text),
          lon: double.parse(textControllerLon.text),
          // TODO(me): добавить url к создаваемому месту
          url: 'исправить',
          details: textControllerDescription.text,
          type: screenAddPlaceState
              .value!.data!.currentlySelectedCategory, //TODO(me): !
        );
        Navigator.pop<bool>(context, true);
      } catch (e) {
        debugPrint(e.toString());
        Navigator.pop<bool>(context, false);
      }
    }
  }

  void onDeletePhoto(int index) {
    //freezed
    screenAddPlaceState.value!.data!.listOfPhotos.removeAt(index);
    //notifyListeners();
  }

  void onDismissPhoto(int index) {
    //freezed
    screenAddPlaceState.value!.data!.listOfPhotos.removeAt(index);
    // notifyListeners();
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

      _screenAddPlaceState.content(
        _screenAddPlaceState.value!.data!
            .copyWith(isButtonSaveActive: isFormValid),
      );

      // notifyListeners();
    }
    // TODO(me): тут еще исправить
  }

  Future<void> onTapOnCategorySelection(BuildContext context) async {
    _screenAddPlaceState.content(
      _screenAddPlaceState.value!.data!.copyWith(
        currentlySelectedCategory: await Navigator.of(context).pushNamed(
          appRouteSelectCategory,
          arguments: screenAddPlaceState.value!.data!.currentlySelectedCategory,
        ) as String,
      ),
    );

    // notifyListeners();
  }

  @override
  void onShowTheMap() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(UiStrings.addPlaceShowing),
      ),
    );
  }
}

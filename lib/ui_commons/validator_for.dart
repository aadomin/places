import 'package:places/ui_commons/ui_strings.dart';

class ValidatorFor {
  static String? descriptionOfPlace(String? value) {
    final String text = value ?? '';
    final _regExp = RegExp(r'^.{1,}$');
    if (!_regExp.hasMatch(text) || text.isEmpty) {
      return UiStrings.addPlaceUncorrectInput;
    }
    return null;
  }

  static String? nameOfPlace(String? value) {
    final String text = value ?? '';
    final _regExp = RegExp(r'^.{1,}$');
    if (!_regExp.hasMatch(text) || text.isEmpty) {
      return UiStrings.addPlaceUncorrectInput;
    }
    return null;
  }

  static String? longitudeOrLatit(String? value) {
    final String text = value ?? '';
    final _regExp = RegExp(r'^-?[0-9]{1,3}(?:\.[0-9]{1,20})?$');
    if (!_regExp.hasMatch(text) || text.isEmpty) {
      return UiStrings.addPlaceUncorrectInput;
    }
    return null;
  }
}

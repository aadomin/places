import 'package:flutter/services.dart';

class FormattersFor {
  static List<TextInputFormatter> descriptionOfPlace() {
    final _regExp = RegExp(r'^.{1,}$');
    return <TextInputFormatter>[
      LengthLimitingTextInputFormatter(12),
      FilteringTextInputFormatter.allow(_regExp),
    ];
  }

  static List<TextInputFormatter> nameOfPlace() {
    final _regExp = RegExp(r'^.{1,}$');
    return <TextInputFormatter>[
      LengthLimitingTextInputFormatter(12),
      FilteringTextInputFormatter.allow(_regExp),
    ];
  }

  static List<TextInputFormatter> longitudeOrLatit() {
    final _regExp = RegExp(r'^-?[0-9]{1,3}(?:\.[0-9]{1,20})?$');
    return <TextInputFormatter>[
      LengthLimitingTextInputFormatter(12),
      FilteringTextInputFormatter.allow(_regExp),
    ];
  }
}

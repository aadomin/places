import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
//внимание! библиотека не поддерживается Flutter for Web

class MyScrollPhysics {
  static ScrollPhysics physics = kIsWeb
      ? BouncingScrollPhysics()
      : Platform.isAndroid
          ? ClampingScrollPhysics()
          : BouncingScrollPhysics();
}

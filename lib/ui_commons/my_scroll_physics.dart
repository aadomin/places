import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';

//внимание! библиотека не поддерживается Flutter for Web

class MyScrollPhysics {
  static ScrollPhysics physics = kIsWeb
      ? const BouncingScrollPhysics()
      : Platform.isAndroid
          ? const ClampingScrollPhysics()
          : const BouncingScrollPhysics();
}

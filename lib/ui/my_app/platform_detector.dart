// import 'dart:io';
// import 'package:flutter/foundation.dart' show kIsWeb;

///
/// Этот класс нужен потому что dart:io не поддерживается Flutter for Web
///
class PlatformDetector {
  //
  // TODO сделать детектор платформы, чтобы веб тоже определял
  // все что ниже - временно
  static bool isAndroid = false;
  static bool isIOS = true;
  static bool isWeb = false;
}

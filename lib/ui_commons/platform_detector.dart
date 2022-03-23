import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

///
/// Этот класс нужен потому что dart:io не поддерживается Flutter for Web
///
class PlatformDetector {
  PlatformDetector() {
    // сначала проверяем именно kIsWeb, иначе ошибка импорт io!
    if (kIsWeb) {
      PlatformDetector.isWeb = true;
    } else {
      if (Platform.isAndroid) {
        PlatformDetector.isAndroid = true;
      }
      if (Platform.isIOS) {
        PlatformDetector.isIOS = true;
      }
    }
  }

  static bool isAndroid = false;
  static bool isIOS = false;
  static bool isWeb = false;
}

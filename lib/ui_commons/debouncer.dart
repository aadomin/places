import 'dart:async';
import 'package:flutter/foundation.dart';

/// Debouncer: Declare it
/// ```dart
/// final _debouncer = Debouncer(milliseconds: 500);
/// ```
///
/// and trigger it
///
/// ```dart
/// onTextChange(String text) {
///   _debouncer.run(() => print(text));
/// ```
/// }
class Debouncer {
  Debouncer({required this.milliseconds});

  final int milliseconds;
  Timer? _timer;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

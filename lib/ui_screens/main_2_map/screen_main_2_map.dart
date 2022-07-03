import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// Экран 2. Карта.
/// Второй из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
///
class ScreenMain2Map extends StatelessWidget {
  const ScreenMain2Map({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(UiStrings.maps),
    );
  }
}

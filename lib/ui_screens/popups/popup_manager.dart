import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_screens/popups/widget_add_to_calendar_cuper_modal.dart';

class PopupManager {
  ///
  /// Показать окно запланировать посещение места
  /// - используется минимум двумя экранами PopupManager
  ///
  Future<void> showPopupSchedulePlace(BuildContext context, int id) async {
    late final DateTime? _result;

    if (PlatformDetector.isAndroid) {
      _result = DateTime.now();
    }
    if (PlatformDetector.isIOS || PlatformDetector.isWeb) {
      _result = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return const WidgetAddToCalendarCuperModal();
        },
      );
    }

    if (_result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$id added to calendar at $_result'),
        ),
      );
    }
  }
}

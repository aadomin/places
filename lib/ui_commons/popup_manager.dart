import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_widgets_commons/widget_add_to_calendar_cuper_modal.dart';

class PopupManager with ChangeNotifier {
  Future<void> showPopupSchedulePlace(BuildContext context, int id) async {
    late final DateTime? _result;
    if (PlatformDetector.isAndroid || PlatformDetector.isWeb) {
      _result = DateTime.now();
    }
    if (PlatformDetector.isIOS) {
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

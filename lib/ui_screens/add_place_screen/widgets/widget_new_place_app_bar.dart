import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';

class WidgetNewPlaceAppBar extends StatelessWidget {
  const WidgetNewPlaceAppBar({
    required this.onCancel,
    Key? key,
  }) : super(key: key);

  final VoidCallback onCancel;
  VoidCallback get ___onCancel => onCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //
        // Cancel button
        //
        Expanded(
          child: Row(
            children: [
              TextButton(
                onPressed: ___onCancel,
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColorLight,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    UiStrings.cancel,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        //
        // NEW PLACE TITLE
        //
        Text(
          UiStrings.newPlace,
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Expanded(
          child: SizedBox.shrink(),
        ),
      ],
    );
  }
}

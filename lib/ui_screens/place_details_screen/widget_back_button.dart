import 'package:flutter/material.dart';

/// Кнопка "Назад"
class WidgetBackButton extends StatelessWidget {
  const WidgetBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: 36,
        height: 36,
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            backgroundColor: Theme.of(context).canvasColor,
          ),
          child: const Icon(Icons.close, size: 20),
        ),
      ),
    );
  }
}

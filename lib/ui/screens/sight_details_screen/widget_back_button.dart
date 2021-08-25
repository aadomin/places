import 'package:flutter/material.dart';

class WidgetBackButton extends StatelessWidget {
  const WidgetBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: 32,
        height: 32,
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            backgroundColor: Theme.of(context).canvasColor,
          ),
          child: const Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Icon(Icons.close, size: 20),
          ),
        ),
      ),
    );
  }
}

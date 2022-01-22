import 'package:flutter/material.dart';

/// Кнопка, прикрепленная к низу экрана
class WidgetBottomButton extends StatefulWidget {
  const WidgetBottomButton({
    required this.onPressOnButton,
    required this.buttonName,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressOnButton;
  final String buttonName;

  @override
  _WidgetBottomButtonState createState() => _WidgetBottomButtonState();
}

class _WidgetBottomButtonState extends State<WidgetBottomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: ElevatedButton(
          onPressed: widget.onPressOnButton,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.buttonName),
          ),
        ),
      ),
    );
  }
}

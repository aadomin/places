import 'package:flutter/material.dart';

/// Кнопка, прикрепленная к низу экрана
class WidgetBottomButton extends StatefulWidget {
  const WidgetBottomButton({
    required this.onPressOnButton,
    required this.buttonName,
    required this.isActive,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressOnButton;
  final String buttonName;
  final bool isActive;

  @override
  _WidgetBottomButtonState createState() => _WidgetBottomButtonState();
}

class _WidgetBottomButtonState extends State<WidgetBottomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        color: Theme.of(context).canvasColor,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: ElevatedButton(
          onPressed: widget.onPressOnButton,
          style: ElevatedButton.styleFrom(
            primary: widget.isActive
                ? const Color(0xFF4CAF50)
                : const Color(0xFFCCCCCC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.buttonName),
          ),
        ),
      ),
    );
  }
}
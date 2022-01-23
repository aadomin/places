import 'package:flutter/material.dart';

class WidgetCircleIndicator extends StatefulWidget {
  const WidgetCircleIndicator({
    required this.kActiveColor,
    required this.kNonActiveColor,
    required this.isActive,
    Key? key,
  }) : super(key: key);
  final bool isActive;
  final Color kActiveColor;
  final Color kNonActiveColor;

  @override
  _WidgetCircleIndicatorState createState() => _WidgetCircleIndicatorState();
}

class _WidgetCircleIndicatorState extends State<WidgetCircleIndicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 6,
      width: widget.isActive ? 16 : 6,
      decoration: BoxDecoration(
          color: widget.isActive ? widget.kActiveColor : widget.kNonActiveColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}

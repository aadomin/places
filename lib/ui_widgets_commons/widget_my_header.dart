import 'package:flutter/material.dart';

///
/// Общий AppBar
///
class WidgetMyHeader extends StatelessWidget {
  const WidgetMyHeader({
    required String header,
    Key? key,
  })  : _header = header,
        super(key: key);

  final String _header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        _header,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

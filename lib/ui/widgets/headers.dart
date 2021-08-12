import 'package:flutter/material.dart';

class WidgetMyHeader extends StatelessWidget {
  const WidgetMyHeader({
    Key key,
    @required String header,
  }) : _header = header, super(key: key);

  final String _header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
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
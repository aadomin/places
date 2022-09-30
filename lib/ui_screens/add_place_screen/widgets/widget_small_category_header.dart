import 'package:flutter/material.dart';

/// Subtitle of category
class WidgetSmallCategoryHeader extends StatelessWidget {
  const WidgetSmallCategoryHeader(
    this.categoryName, {
    Key? key,
  }) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 12),
      child: Text(
        categoryName,
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}

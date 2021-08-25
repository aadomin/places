import 'package:flutter/material.dart';

class CategoryHeaderWidget extends StatelessWidget {
  final String categoryName;
  CategoryHeaderWidget(
    this.categoryName, {
    Key? key,
  }) : super(key: key);

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

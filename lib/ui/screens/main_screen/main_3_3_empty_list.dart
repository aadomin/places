import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

class WidgetEmptyList extends StatelessWidget {
  const WidgetEmptyList({
    required this.commentLine,
    Key? key,
  }) : super(key: key);

  final String commentLine;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.monochrome_photos,
            color: Colors.grey.shade300,
            size: 40,
          ),
          Text('Пусто',
              style: tsVisitingScreenNoItemsHeader,
              textAlign: TextAlign.center),
          Text(
            commentLine,
            style: tsVisitingScreenNoItemsText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../res/text_styles.dart';

class WidgetEmptyList extends StatelessWidget {
  final String commentLine;

  WidgetEmptyList(this.commentLine);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
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

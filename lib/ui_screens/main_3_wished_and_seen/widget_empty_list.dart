import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:places/ui_commons/text_styles.dart';

/// Экран "Избранные и посещенные", состояние когда список пуст
/// 
class WidgetEmptyList extends StatelessWidget {
  const WidgetEmptyList({
    required this.imagePath,
    required this.headerLine,
    required this.commentLine,
    Key? key,
  }) : super(key: key);

  final String imagePath;
  final String headerLine;
  final String commentLine;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            color: const Color(0x887C7E92),
            width: 70,
          ),
          const SizedBox(height: 10),
          Text(
            headerLine,
            style: tsVisitingScreenNoItemsHeader,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
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

import 'package:flutter/material.dart';
import '../../domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(sight.name),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../domain/sight.dart';
import '../res/text_styles.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  width: double.infinity,
                  height: 100,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.only(right: 16, left: 16),
                  alignment: Alignment.topLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2,
                    ),
                    child: Text(
                      sight.name,
                      style: styleH3,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 4, right: 16, left: 16),
                  alignment: Alignment.topLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2,
                    ),
                    child: Text(
                      sight.details,
                      style: styleH6,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                sight.type,
                style: styleOfLabel,
              ),
              width: double.infinity,
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(16),
              child: Container(
                color: Colors.white,
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

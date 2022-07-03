import 'package:flutter/material.dart';

/// Галочка
class WidgetCheckmark extends StatelessWidget {
  const WidgetCheckmark({
    required double radiusOfRoundElement,
    Key? key,
  })  : ___radiusOfRoundElement = radiusOfRoundElement,
        super(key: key);

  final double ___radiusOfRoundElement;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ___radiusOfRoundElement * 2,
      height: ___radiusOfRoundElement * 2,
      child: Align(
        alignment: Alignment.bottomRight,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Icon(
                Icons.done,
                size: 17,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

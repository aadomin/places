import 'package:flutter/material.dart';
import 'package:places/ui_my_app/routes.dart';
import 'package:places/ui_my_app/ui_strings.dart';

class WidgetNewPlaceButton extends StatelessWidget {
  const WidgetNewPlaceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 200,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ROUTE_ADD);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.add,
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(UiStrings.newPlace),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/themes.dart';
import 'package:places/ui_commons/ui_strings.dart';

/// Кнопка "Новое место"
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Material(
              borderRadius: BorderRadius.circular(32),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ROUTE_ADD);
                },
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: Theme.of(context).colorScheme.newPlaceGradient,
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.redAccent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 20,
                        color: Theme.of(context)
                            .colorScheme
                            .textOnBottomButtonActive,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                          UiStrings.newPlaceCap,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context)
                                .colorScheme
                                .textOnBottomButtonActive,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

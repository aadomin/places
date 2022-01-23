import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';

///
/// Отображается, если при поиске ничего не найдено
///
class WidgetSearchNotFound extends StatelessWidget {
  const WidgetSearchNotFound({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Icon(
                Icons.search,
                size: 30,
                color: Theme.of(context).primaryColorLight,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  UiStrings.nothingIsFounded,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
              Text(
                UiStrings.tryToChangeParametersOfSearch,
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

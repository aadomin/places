import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';

class WidgetSearchAppBar extends StatelessWidget {
  const WidgetSearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //
        // Кнопка Назад
        //
        Expanded(
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        //
        // Заголовок страницы
        //
        Text(
          UiStrings.searchHeader,
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Expanded(
          child: SizedBox.shrink(),
        ),
      ],
    );
  }
}

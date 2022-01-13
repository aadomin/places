import 'package:flutter/material.dart';

class WidgetSearchAppBar extends StatelessWidget {
  const WidgetSearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Кнопка Назад
        Expanded(
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColorLight,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Отмена',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        //
        // Заголовок
        //
        Text(
          'Поиск',
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

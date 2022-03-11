import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/domain_entities/search_entitiy2.dart';
import 'package:provider/provider.dart';

///
/// Отображается, пока поле поиска еще пустое
///
class WidgetSearchEmpty extends StatelessWidget {
  const WidgetSearchEmpty({
    required this.textController,
    this.keyOfSearchTextField,
    Key? key,
  }) : super(key: key);

  final TextEditingController textController;
  final Key? keyOfSearchTextField;

  @override
  Widget build(BuildContext context) {
    final List<String> lastSearchesSnapshot =
        context.watch<SearchEntity2>().lastSearches;
    return Column(
      children: [
        for (var i = 0; i < lastSearchesSnapshot.length; i++)
          Column(
            children: [
              ListTile(
                //
                // Кнопка выбора прошлого поиска
                //
                title: TextButton(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      lastSearchesSnapshot[i],
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                  onPressed: () {
                    textController.text = lastSearchesSnapshot[i];

                    context
                        .read<SearchEntity2>()
                        .searchPlaces(lastSearchesSnapshot[i]);
                  },
                ),

                //
                // Кнопка удаление какого-то запомненного поиска
                //
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context.read<SearchEntity2>().removeItemFromHistory(i);
                  },
                ),
              ),
              const Divider(),
            ],
          ),
        //
        // Кнопка Очистить историю поиска
        //
        if (lastSearchesSnapshot.isNotEmpty)
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              child: Text(
                UiStrings.clearHistory,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () {
                context.read<SearchEntity2>().removeAllItemsFromHistory();
              },
            ),
          ),
      ],
    );
  }
}

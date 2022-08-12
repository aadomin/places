import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/place_search_screen/screen_search_vm.dart';

///
/// Отображается, пока поле поиска еще пустое
///
class WidgetSearchEmpty extends StatelessWidget {
  const WidgetSearchEmpty({
    required this.lastSearchesSnapshot,
    required this.onTapOnOneOfLastSearchesDo,
    required this.onTapOnRemoveItemFromHistory,
    required this.onTapOnRemoveAllItemsFromHistory,
    required this.textController,
    Key? key,
  }) : super(key: key);

  final TextEditingController textController;

  final List<String> lastSearchesSnapshot;

  final void Function(int) onTapOnOneOfLastSearchesDo;

  void onTapOnOneOfLastSearches(int i) {
    //TODO(me): del textController from here
    textController.text = lastSearchesSnapshot[i];
    onTapOnOneOfLastSearchesDo(i);
  }

  final void Function(int) onTapOnRemoveItemFromHistory;

  final void Function() onTapOnRemoveAllItemsFromHistory;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => onTapOnOneOfLastSearches(i),
                ),

                //
                // Кнопка удаление какого-то запомненного поиска
                //
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => onTapOnRemoveItemFromHistory(i),
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
              onPressed: onTapOnRemoveAllItemsFromHistory,
              child: Text(
                UiStrings.clearHistory,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/domain_interactors/search_interactor.dart';
import 'package:places/ui_screens/place_search_screen/screen_search_vm.dart';
import 'package:provider/provider.dart';

///
/// Отображается, пока поле поиска еще пустое
///
class WidgetSearchEmpty extends StatelessWidget {
  const WidgetSearchEmpty({
    required this.viewModel,
    required this.textController,
    this.keyOfSearchTextField,
    Key? key,
  }) : super(key: key);

  final ScreenSearchVM viewModel;
  final TextEditingController textController;
  final Key? keyOfSearchTextField;

  @override
  Widget build(BuildContext context) {
    final ScreenSearchVM __viewModel = viewModel;

    return Column(
      children: [
        for (var i = 0; i < __viewModel.lastSearchesSnapshot.length; i++)
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
                      __viewModel.lastSearchesSnapshot[i],
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                  onPressed: () {
                    // ВОПРОСТУТ
                    textController.text = __viewModel.lastSearchesSnapshot[i];

                    __viewModel.onTapOnOneOfLastSearches(i);
                  },
                ),

                //
                // Кнопка удаление какого-то запомненного поиска
                //
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => __viewModel.onTapOnRemoveItemFromHistory(i),
                ),
              ),
              const Divider(),
            ],
          ),
        //
        // Кнопка Очистить историю поиска
        //
        if (__viewModel.lastSearchesSnapshot.isNotEmpty)
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              child: Text(
                UiStrings.clearHistory,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () => __viewModel.onTapOnRemoveAllItemsFromHistory(),
            ),
          ),
      ],
    );
  }
}

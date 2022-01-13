import 'package:flutter/material.dart';
import 'package:places/ui_interactors/search_interactor.dart';
import 'package:provider/provider.dart';

///
/// Отображается, пока поле поиска еще пустое
///
class WidgetSearchEmpty extends StatelessWidget {
  const WidgetSearchEmpty({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0;
            i < context.watch<SearchInteractor>().lastSearches.length;
            i++)
          Column(
            children: [
              ListTile(
                title: Text(
                  context.watch<SearchInteractor>().lastSearches[i],
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context.read<SearchInteractor>().removeItemFromHistory(i);
                  },
                ),
              ),
              const Divider(),
            ],
          ),
      ],
    );
  }
}

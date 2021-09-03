import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/enums.dart';
import 'package:places/ui/my_app/ui_strings.dart';
import 'package:places/ui/screens/sight_search_screen/sight_search_model.dart';
import 'package:places/ui/widgets/sight_card_for_search.dart';
import 'package:places/ui/widgets/headers.dart';

import 'package:places/data/models/sight.dart';

class SightSearchScreen extends StatelessWidget {
  SightSearchScreen({Key? key}) : super(key: key);

  final FocusNode focusNode1 = FocusNode();

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const WidgetMyHeader(header: UiStrings.searching),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),

              // Поле ввода
              child: TextField(
                focusNode: focusNode1,
                controller: textController,
                onChanged: (String value) {
                  context.read<MySearchModel>().newSearch(value);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, size: 15),
                  suffixIcon: InkWell(
                    onTap: () {
                      textController.clear();
                      context.read<MySearchModel>().newSearch('');
                    },
                    child: UnconstrainedBox(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            child: Icon(
                              Icons.close,
                              size: 14,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Поиск',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                ),
              ),
            ),
            if (context.watch<MySearchModel>().searchStatus ==
                SearchStatus.haveResult)
              const WidgetSearchResult(),
            if (context.watch<MySearchModel>().searchStatus ==
                SearchStatus.empty)
              const WidgetSearchEmpty(),
            if (context.watch<MySearchModel>().searchStatus ==
                SearchStatus.notFound)
              const WidgetSearchNotFound(),
          ],
        ),
      ),
    );
  }
}

///
/// Результаты поиска
///
class WidgetSearchResult extends StatelessWidget {
  const WidgetSearchResult({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Sight> searchResults =
        context.watch<MySearchModel>().searchResult;
    return Column(
      children: [
        for (var i = 0; i < searchResults.length; i++)
          SightCartForSearch(
            sight: context.watch<MySearchModel>().searchResult[i],
          ),
      ],
    );
  }
}

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
            i < context.watch<MySearchModel>().lastSearches.length;
            i++)
          Column(
            children: [
              ListTile(
                title: Text(
                  context.watch<MySearchModel>().lastSearches[i],
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context.read<MySearchModel>().removeItemFromHistory(i);
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
              Icon(Icons.search,
                  size: 30, color: Theme.of(context).primaryColorLight),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$UiStrings.nothingIsFounded',
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColorLight),
                ),
              ),
              Text(
                '$UiStrings.tryToChangeParametersOfSearch',
                style: TextStyle(color: Theme.of(context).primaryColorLight),
              )
            ],
          ),
        ),
      ],
    );
  }
}

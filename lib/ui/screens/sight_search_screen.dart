import 'package:flutter/material.dart';
import 'package:places/ui/models/ui_search_model.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/models/my_places_model.dart';
import '../elements/sight_card.dart';
import '../../mocks.dart';
import '../../domain/sight.dart';
import '../elements/sight_card_for_search.dart';

class SightSearchScreen extends StatelessWidget {
  FocusNode focusNode1 = FocusNode();

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 140,
        title: Padding(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: Container(
            width: 290,
            height: 90,
            padding: EdgeInsets.only(bottom: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                text: 'Список интересных мест',
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                focusNode: focusNode1,
                controller: textController,
                onChanged: (String value) {
                  context.read<MySearchModel>().newSearch(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 15),
                  suffixIcon: InkWell(
                    onTap: () {
                      textController.clear();
                      context.read<MySearchModel>().newSearch('');
                    },
                    child: UnconstrainedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
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
            if (context.watch<MySearchModel>().searchStatus == 'have result')
              WidgetSearchResult(),
            if (context.watch<MySearchModel>().searchStatus == 'empty')
              WidgetSearchEmpty(),
            if (context.watch<MySearchModel>().searchStatus == 'not found')
              WidgetSearchNotFound(),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

class WidgetSearchResult extends StatelessWidget {
  const WidgetSearchResult({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Sight> searchResults = context.watch<MySearchModel>().searchResult;

    return Column(
      children: [
        for (var i = 0; i < searchResults.length; i++)
          SightCartForSearch(
            context.watch<MySearchModel>().searchResult[i],
          ),
      ],
    );
  }
}

class WidgetSearchEmpty extends StatelessWidget {
  const WidgetSearchEmpty({
    Key key,
  }) : super(key: key);

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
                  icon: Icon(Icons.close),
                  onPressed: () {
                    context.read<MySearchModel>().removeItemFromHistory(i);
                  },
                ),
              ),
              Divider(),
            ],
          ),
      ],
    );
  }
}

class WidgetSearchNotFound extends StatelessWidget {
  const WidgetSearchNotFound({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
            child: Column(
          children: [
            Icon(Icons.search,
                size: 30, color: Theme.of(context).primaryColorLight),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ничего не найдено',
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColorLight),
              ),
            ),
            Text(
              'Попробуйте изменить параметры поиска',
              style: TextStyle(color: Theme.of(context).primaryColorLight),
            )
          ],
        )),
      ],
    );
  }
}

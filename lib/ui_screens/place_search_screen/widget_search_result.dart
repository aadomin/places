import 'package:flutter/material.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_screens/place_search_screen/widget_place_card_for_search.dart';
import 'package:places/domain_entities/search_entity.dart';
import 'package:provider/provider.dart';

///
/// Результаты поиска
///
class WidgetSearchResult extends StatelessWidget {
  const WidgetSearchResult({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Place> searchResults =
        context.watch<SearchEntity>().searchResult;
    return Column(
      children: [
        for (var i = 0; i < searchResults.length; i++)
          WidgetPlaceCartForSearch(
            place: context.watch<SearchEntity>().searchResult[i],
          ),
      ],
    );
  }
}

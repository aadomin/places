import 'package:flutter/material.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_screens/place_search_screen/widget_place_card_for_search.dart';

///
/// Результаты поиска
///
class WidgetSearchResult extends StatelessWidget {
  const WidgetSearchResult({
    required this.searchResult,
    required this.textOfSearching,
    Key? key,
  }) : super(key: key);

  final List<Place> searchResult;
  final String textOfSearching;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < searchResult.length; i++)
          WidgetPlaceCartForSearch(
              place: searchResult[i], searchingText: textOfSearching),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_screens/place_search_screen/widget_place_card_for_search.dart';
import 'package:places/domain_interactors/search_interactor.dart';
import 'package:provider/provider.dart';

///
/// Результаты поиска
///
class WidgetSearchResult extends StatelessWidget {
  const WidgetSearchResult({
    required this.searchResult,
    Key? key,
  }) : super(key: key);

  final List<Place> searchResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < searchResult.length; i++)
          WidgetPlaceCartForSearch(
            place: searchResult[i],
          ),
      ],
    );
  }
}

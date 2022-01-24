import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_app_bar.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_empty.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_not_found.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_result.dart';
import 'package:places/ui_widgets_commons/widget_textfield_clear_button.dart';
import 'package:provider/provider.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_interactors/search_interactor.dart';

/// Экран "Поиск"
class PlaceSearchScreen extends StatelessWidget {
  PlaceSearchScreen({Key? key}) : super(key: key);

  final FocusNode focusNode1 = FocusNode();

  final textController = TextEditingController();
  final keyOfSearchTextField = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const WidgetSearchAppBar(),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              //
              // Поле ввода
              //
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: TextField(
                  key: keyOfSearchTextField,
                  focusNode: focusNode1,
                  autofocus: true,
                  controller: textController,
                  onChanged: (String value) {
                    context.read<SearchInteractor>().searchPlaces(value);
                  },
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        top: 15, bottom: 10, left: 10, right: 10),
                    border: InputBorder.none,
                    hintText: UiStrings.searching,
                    filled: true,
                    fillColor: Theme.of(context).disabledColor,
                    prefixIcon: const Icon(Icons.search, size: 15),
                    suffixIcon: WidgetTextFieldClearButton(
                      textController: textController,
                      onTap: () {
                        searchInteractor.searchPlaces('');
                      },
                    ),
                  ),
                ),
              ),
            ),
            //
            // Основная страница
            //
            if (context.watch<SearchInteractor>().searchStatus ==
                SearchStatus.haveResult)
              const WidgetSearchResult(),
            if (context.watch<SearchInteractor>().searchStatus ==
                SearchStatus.empty)
              WidgetSearchEmpty(
                textController: textController,
                keyOfSearchTextField: keyOfSearchTextField,
              ),
            if (context.watch<SearchInteractor>().searchStatus ==
                SearchStatus.notFound)
              const WidgetSearchNotFound(),
          ],
        ),
      ),
    );
  }
}

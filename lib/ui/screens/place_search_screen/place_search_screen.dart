import 'package:flutter/material.dart';
import 'package:places/ui/screens/place_search_screen/widget_search_app_bar.dart';
import 'package:places/ui/screens/place_search_screen/widget_search_empty.dart';
import 'package:places/ui/screens/place_search_screen/widget_search_not_found.dart';
import 'package:places/ui/screens/place_search_screen/widget_search_result.dart';
import 'package:places/ui_common_widgets/widget_textfield_clear_button.dart';
import 'package:provider/provider.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_interactors/search_interactor.dart';

/// Экран "Поиск"
class PlaceSearchScreen extends StatelessWidget {
  PlaceSearchScreen({Key? key}) : super(key: key);

  final FocusNode focusNode1 = FocusNode();

  final textController = TextEditingController();

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
                  focusNode: focusNode1,
                  autofocus: true,
                  controller: textController,
                  onChanged: (String value) {
                    context.read<SearchInteractor>().searchPlaces(value);
                  },
                  
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        top: 15, bottom: 10, left: 10, right: 10),
                    border: InputBorder.none,
                    hintText: UiStrings.searching,
                    filled: true,
                    fillColor: const Color(0xfff5f5f5),
                    prefixIcon: const Icon(Icons.search, size: 15),
                    suffixIcon: WidgetTextFieldClearButton(
                      fieldHasFocus: focusNode1.hasFocus,
                      textController: textController,
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
              WidgetSearchEmpty(textController: textController),
            if (context.watch<SearchInteractor>().searchStatus ==
                SearchStatus.notFound)
              const WidgetSearchNotFound(),
          ],
        ),
      ),
    );
  }
}

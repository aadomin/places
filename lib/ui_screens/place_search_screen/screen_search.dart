import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/place_search_screen/redux_actions.dart';
import 'package:places/ui_screens/place_search_screen/redux_reducers.dart';
import 'package:places/ui_screens/place_search_screen/redux_store.dart';
import 'package:places/ui_screens/place_search_screen/screen_search_vm.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_app_bar.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_empty.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_not_found.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_result.dart';
import 'package:places/ui_widgets_commons/widget_textfield_clear_button.dart';
import 'package:redux/redux.dart';

/// Экран "Поиск"
class ScreenSearch extends StatefulWidget {
  const ScreenSearch({required this.viewModel, Key? key}) : super(key: key);

  final ScreenSearchVM viewModel;

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  ScreenSearchVM get ___viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    ___viewModel
      ..addListener(_vmListener)
      ..initVM();
    ___viewModel.store.dispatch(OnInitAction(
      ___viewModel.searchInteractor,
    ));
  }

  void _vmListener() {
    setState(() {});
    ___viewModel.store.dispatch(OnStateWasUpdatedAction());
  }

  @override
  void dispose() {
    ___viewModel
      ..disposeVM()
      ..removeListener(_vmListener);
    super.dispose();
  }

  //

  final FocusNode focusNode1 = FocusNode();

  late final textController = ___viewModel.textController;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: ___viewModel.store,
      child: Scaffold(
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
                    onChanged: (String value) =>
                        ___viewModel.onSearchFieldChanged(value),
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
                      // Значок Поиск
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(9),
                        child: SvgPicture.asset(
                          UiImagePaths.search,
                          width: 18,
                          height: 18,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      suffixIcon: StoreConnector<ReduxStore, void Function()>(
                          converter: (store) => () => store.dispatch(
                                OnTapOnClearButtonAction(),
                              ),
                          builder: (context, ___onTapOnClearButton) {
                            return WidgetTextFieldClearButton(
                              textController: textController,
                              onTap: () => ___onTapOnClearButton(),
                            );
                          }),
                    ),
                  ),
                ),
              ),
              //
              // Основная страница
              //
              StoreConnector<ReduxStore, SearchStatus>(
                  converter: (store) => store.state.searchStatus,
                  builder: (context, ___searchStatus) {
                    return StoreConnector<ReduxStore, List<Place>>(
                        converter: (store) => store.state.searchResult,
                        builder: (context, ___searchResult) {
                          return StoreConnector<ReduxStore, List<String>>(
                              converter: (store) =>
                                  store.state.lastSearchesSnapshot,
                              builder: (context, ___lastSearchesSnapshot) {
                                return StoreConnector<ReduxStore,
                                        void Function(int)>(
                                    converter: (store) => (i) => store.dispatch(
                                          OnTapOnOneOfLastSearchesAction(i),
                                        ),
                                    builder:
                                        (context, ___onTapOnOneOfLastSearches) {
                                      return StoreConnector<ReduxStore,
                                              void Function()>(
                                          converter: (store) =>
                                              () => store.dispatch(
                                                    OnTapOnRemoveAllItemsFromHistoryAction(),
                                                  ),
                                          builder: (context,
                                              ___onTapOnRemoveAllItemsFromHistory) {
                                            return StoreConnector<ReduxStore,
                                                    void Function(int)>(
                                                converter: (store) =>
                                                    (i) => store.dispatch(
                                                          OnTapOnRemoveItemFromHistoryAction(
                                                              i),
                                                        ),
                                                builder: (context,
                                                    ___onTapOnRemoveItemFromHistory) {
                                                  return Builder(
                                                    builder: (context) {
                                                      switch (___searchStatus) {
                                                        case SearchStatus
                                                            .haveResult:
                                                          return WidgetSearchResult(
                                                            searchResult:
                                                                ___searchResult,
                                                            textOfSearching:
                                                                ___viewModel
                                                                    .textController
                                                                    .text,
                                                          );
                                                        case SearchStatus.empty:
                                                          return WidgetSearchEmpty(
                                                            lastSearchesSnapshot:
                                                                ___lastSearchesSnapshot,
                                                            textController:
                                                                textController,
                                                            onTapOnOneOfLastSearchesDo:
                                                                ___onTapOnOneOfLastSearches,
                                                            onTapOnRemoveAllItemsFromHistory:
                                                                ___onTapOnRemoveAllItemsFromHistory,
                                                            onTapOnRemoveItemFromHistory:
                                                                ___onTapOnRemoveItemFromHistory,
                                                          );
                                                        case SearchStatus
                                                            .notFound:
                                                          return const WidgetSearchNotFound();
                                                      }
                                                    },
                                                  );
                                                });
                                          });
                                    });
                              });
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

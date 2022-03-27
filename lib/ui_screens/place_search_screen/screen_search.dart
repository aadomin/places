import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_screens/place_search_screen/screen_search_vm.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_app_bar.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_empty.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_not_found.dart';
import 'package:places/ui_screens/place_search_screen/widget_search_result.dart';
import 'package:places/ui_widgets_commons/widget_textfield_clear_button.dart';
import 'package:provider/provider.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/domain_interactors/search_interactor.dart';

/// Экран "Поиск"
class ScreenSearch extends StatefulWidget {
  const ScreenSearch({required this.viewModel, Key? key}) : super(key: key);

  final ScreenSearchVM viewModel;

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  ScreenSearchVM get __viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    __viewModel.addListener(_vmListener);
  }

  void _vmListener() => setState(() {});

  @override
  void dispose() {
    // TODO(me): тут ошибка возникает!!!
    //__viewModel.dispose();
    __viewModel.removeListener(_vmListener);
    super.dispose();
  }

  //

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
                    suffixIcon: WidgetTextFieldClearButton(
                      textController: textController,
                      onTap: () {
                        context.watch<SearchInteractor>().searchPlaces('');
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

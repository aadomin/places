import 'package:flutter/material.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_vm.dart';
import 'package:places/ui_screens/main_1_places_list/widget_my_sliver_app_bar.dart';
import 'package:places/ui_screens/main_1_places_list/widget_new_place_button.dart';
import 'package:places/ui_screens/main_1_places_list/widget_searching_header.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/my_scroll_physics.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details_di.dart';
import 'package:places/ui_widgets_commons/widget_place_card.dart';

/// Экран 1. Список мест.
/// Первый из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
/// Данный класс описывает разные состояния экрана (в т.ч. ошибка, загрузка)
///
class ScreenMain1Places extends StatefulWidget {
  const ScreenMain1Places({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final ScreenMain1PlacesVM viewModel;

  @override
  _ScreenMain1PlacesState createState() => _ScreenMain1PlacesState();
}

class _ScreenMain1PlacesState extends State<ScreenMain1Places> {
  /// ширина экрана при которой появляются 2 столбца
  static const criticalWidth = 800.0;

  ScreenMain1PlacesVM get ___viewModel => widget.viewModel;

  @override
  void initState() {
    widget.viewModel.addListener(_vmListener);
    widget.viewModel.initVM();
    super.initState();
  }

  void _vmListener() => setState(() {});

  @override
  void dispose() {
    widget.viewModel.disposeVM();
    widget.viewModel.removeListener(_vmListener);
    super.dispose();
  }

  late List<Place> ___filteredPlaces = [];

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode1 = FocusNode();

    ___filteredPlaces = ___viewModel.filteredPlaces;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: MyScrollPhysics.physics,
            slivers: [
              // Свой AppBar
              SliverPersistentHeader(
                delegate: WidgetMySliverAppBar(expandedHeight: 150.0),
                pinned: true,
              ),

              // Заголовок "Поиск"
              WidgetSearchingHeader(focusNode1: focusNode1),

              if (___filteredPlaces.isEmpty)
                const Center(
                  child: CircularProgressIndicator(),
                ),

              // TODO(me): error
              // if (context.watch<PlacesInteractor>().isRequestDoneWithError) {
              //   return const Scaffold(
              //     body: WidgetNetworkError(),
              //   );
              // }

              // ОСНОВНОЙ СПИСОК широкий вариат (в два столбеца)
              if (MediaQuery.of(context).size.width <= criticalWidth)
                narrowList(context),
              if (MediaQuery.of(context).size.width > criticalWidth)
                wideList(context),
            ],
          ),
          const WidgetNewPlaceButton(),
        ],
      ),
    );
  }

  SliverGrid wideList(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: criticalWidth,
        // удачная формула соотношения
        childAspectRatio:
            MediaQuery.of(context).size.width / criticalWidth * 1.55,
      ),
      delegate: SliverChildListDelegate([
        for (var i = 0; i < ___filteredPlaces.length; i++)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: WidgetPlaceCard(
              place: ___filteredPlaces[i],
              placeCardType: PlaceCardType.general,
              isLiked: ___filteredPlaces[i].wished,
              onTap: () {
                onTap(
                  context,
                  ___filteredPlaces[i].id,
                );
              },
              onToggleWished: () {
                if (___filteredPlaces[i].wished) {
                  ___viewModel.onRemoveFromFavorites(___filteredPlaces[i].id);
                } else {
                  ___viewModel.onAddToFavorites(___filteredPlaces[i].id);
                }
              },
              onDeleteAtAll: () {
                ___viewModel.onRemoveAtAll(___filteredPlaces[i].id);
              },
            ),
          ),
      ]),
    );
  }

  SliverList narrowList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          try {
            print(i);
            return Padding(
              key: UniqueKey(),
              padding: const EdgeInsets.all(16.0),
              child: WidgetPlaceCard(
                place: ___filteredPlaces[i],
                placeCardType: PlaceCardType.general,
                isLiked: ___filteredPlaces[i].wished,
                onTap: () {
                  onTap(
                    context,
                    ___filteredPlaces[i].id,
                  );
                },
                onToggleWished: () {
                  if (___filteredPlaces[i].wished) {
                    ___viewModel.onRemoveFromFavorites(___filteredPlaces[i].id);
                  } else {
                    ___viewModel.onAddToFavorites(___filteredPlaces[i].id);
                  }
                },
                onDeleteAtAll: () {
                  ___viewModel.onRemoveAtAll(___filteredPlaces[i].id);
                },
              ),
            );
          } on Object catch (e) {
            // TODO
            print(e);
            print(i.toString());
            print('Lenght: ${___filteredPlaces.length}');
            return const Text('X');
          }
        },
        childCount: ___filteredPlaces.length,
      ),
    );
  }

  // TODO
  void onTap(BuildContext context, int id) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => createScreenPlaceDetails(
        context: context,
        placeId: id,
      ),
    );
  }
}

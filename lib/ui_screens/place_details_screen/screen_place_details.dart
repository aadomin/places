import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui_commons/themes.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details_vm.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_commons/my_scroll_physics.dart';
import 'package:places/ui_screens/place_details_screen/widget_back_button.dart';
import 'package:places/ui_widgets_commons/widget_my_image.dart';
import 'package:places/domain_models/place.dart';

/// Экран "Детальная страница места"
class ScreenPlaceDetails extends StatefulWidget {
  const ScreenPlaceDetails({
    required this.viewModel,
    required this.placeId,
    Key? key,
  }) : super(key: key);

  final ScreenPlaceDetailsVM viewModel;
  final int placeId;

  @override
  _ScreenPlaceDetailsState createState() => _ScreenPlaceDetailsState();
}

class _ScreenPlaceDetailsState extends State<ScreenPlaceDetails> {
  final PageController _pageController = PageController();

  ScreenPlaceDetailsVM get __viewModel => widget.viewModel;

  double _selectedPage = 0;

  @override
  void initState() {
    __viewModel.init();
    __viewModel.addListener(_vmListener);
    super.initState();
  }

  void _vmListener() => setState(() {});

  @override
  void dispose() {
    __viewModel.removeListener(_vmListener);
    __viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ТУТВОПРОС
    final Place __sight = __viewModel.getPlaceDetails(
      placeId: widget.placeId,
    );
    final int __countOfPages = __sight.url.length;

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        child: Container(
          color: Theme.of(context).canvasColor,
          child: CustomScrollView(
            physics: MyScrollPhysics.physics,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 250,
                flexibleSpace: Container(
                  height: 250,
                  child: Stack(
                    children: [
                      //
                      // Картинки
                      //
                      PageView(
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _selectedPage = page.toDouble();
                          });
                        },
                        children: [
                          for (var i = 0; i < __countOfPages; i++)
                            Container(
                              height: 300,
                              width: 300,
                              child: WidgetMyImage(
                                url: __sight.url[i],
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                      //
                      // Кнопка Закрыть
                      //
                      const Align(
                        alignment: Alignment.topRight,
                        child: WidgetBackButton(),
                      ),
                      //
                      // Индикатор текущей фотки
                      //
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              // рассчитываю отступ
                              left: _selectedPage *
                                  MediaQuery.of(context).size.width /
                                  __countOfPages),
                          child: SizedBox(
                            // рассчитываю ширину
                            width: MediaQuery.of(context).size.width /
                                __countOfPages,
                            height: 6,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(3),
                              ),
                              child: Container(
                                // TODO(me): исправить этот цвет
                                color: Theme.of(context)
                                    .colorScheme
                                    .detailScreenPhotoIndicator,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                    top: 32,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Column(
                    children: [
                      //
                      // Название объекта
                      //
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          __sight.name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      //
                      // Тип объекта
                      //
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(
                              __sight.type,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //
                            // и закрыто
                            //
                            Text(
                              '    закрыто до 09:00',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      // Детальное описание
                      //
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(top: 24),
                        child: Text(
                          __sight.details,
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                      //
                      // Кнопка Построить маршрут
                      //
                      Container(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // print('построить');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  UiImagePaths.route,
                                  height: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .textOnBottomButtonActive,
                                ),
                                Text(
                                  '  ${UiStrings.drawTrack}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .textOnBottomButtonActive,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //
                      // Ряд из 2х кнопок
                      //
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //
                            // Кнопка Запланировать
                            //
                            TextButton(
                              onPressed: () {
                                __viewModel.onShowPopupSchedulePlace(
                                    placeId: __sight.id);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 6, top: 12, bottom: 12),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      UiImagePaths.calendar,
                                      height: 12,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    const Text(
                                      '  ${UiStrings.plan}',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //
                            // Кнопка В избранное
                            //
                            TextButton(
                              // ТУТВОПРОС
                              onPressed: __sight.wished
                                  ? () {
                                      __viewModel.onRemoveFromFavorites(
                                          placeId: __sight.id);
                                    }
                                  : () {
                                      __viewModel.onAddToFavorites(
                                          placeId: __sight.id);
                                    },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 6, top: 12, bottom: 12),
                                child: Row(
                                  children: [
                                    //ignore: prefer_if_elements_to_conditional_expressions
                                    SvgPicture.asset(
                                      __sight.wished
                                          ? UiImagePaths.heart_filled
                                          : UiImagePaths.heart,
                                      height: 12,
                                      color: Theme.of(context).primaryColor,
                                    ),

                                    Text(
                                      __sight.wished
                                          ? '  ${UiStrings.removeFromFavorites}'
                                          : '  ${UiStrings.addToFavorites}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 400,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

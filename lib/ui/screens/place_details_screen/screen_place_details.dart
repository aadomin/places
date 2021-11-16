import 'package:flutter/material.dart';
import 'package:places/ui_interactors/place_interactor.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_my_app/ui_strings.dart';
import 'package:places/ui_my_app/my_scroll_physics.dart';
import 'package:places/ui/screens/place_details_screen/widget_back_button.dart';
import 'package:places/ui_widgets/my_image_widget.dart';

import 'package:places/domain_models/place.dart';

class ScreenPlaceDetails extends StatefulWidget {
  const ScreenPlaceDetails({
    required this.placeId,
    Key? key,
  }) : super(key: key);
  final int placeId;

  @override
  _ScreenPlaceDetailsState createState() => _ScreenPlaceDetailsState();
}

class _ScreenPlaceDetailsState extends State<ScreenPlaceDetails> {
  final PageController _pageController = PageController();

  double _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    final Place sight =
        context.watch<PlaceInteractor>().getPlaceDetails(widget.placeId);
    final int _countOfPages = sight.url.length;

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
                      PageView(
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _selectedPage = page.toDouble();
                          });
                        },
                        children: [
                          for (var i = 0; i < _countOfPages; i++)
                            Container(
                              height: 300,
                              width: 300,
                              child: MyImageWidget(
                                url: sight.url[i],
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: WidgetBackButton(),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: _selectedPage *
                                  MediaQuery.of(context).size.width /
                                  _countOfPages),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width /
                                _countOfPages,
                            height: 6,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(3),
                              ),
                              child: Container(
                                color: const Color(0xFF252849),
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
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                          bottom: 2,
                        ),
                        child: Text(
                          sight.name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(
                              sight.type,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '    закрыто до 09:00',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: Text(
                          sight.details,
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // print('построить');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  size: 12,
                                ),
                                Text(
                                  '  ${UiStrings.drawTrack}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                context
                                    .read<PlaceInteractor>()
                                    .schedulePlace(context, sight.id);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 6, 16, 6),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.play_arrow,
                                      size: 12,
                                    ),
                                    Text(
                                      '  ${UiStrings.plan}',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: sight.wished
                                  ? () {
                                      context
                                          .read<PlaceInteractor>()
                                          .removeFromFavorites(sight.id);
                                    }
                                  : () {
                                      context
                                          .read<PlaceInteractor>()
                                          .addToFavorites(sight.id);
                                    },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 6, 16, 6),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite,
                                      size: 12,
                                    ),
                                    Text(
                                      sight.wished
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:places/ui/screens/sight_details_screen/sight_details_model.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/MyImageWidget.dart';
import 'package:places/ui/res/ui_strings.dart';
import 'package:places/ui/my_scroll_physics.dart';
import 'sight_details_model.dart';
import 'widget_back_button.dart';

class SightDetailsScreen extends StatefulWidget {
  SightDetailsScreen({Key? key, required this.sightID}) : super(key: key);
  final int sightID;

  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  final PageController _pageController = PageController();

  double _selectedPage = 0;

  int _countOfPages = 4;

  late Sight sight;

  @override
  Widget build(BuildContext context) {
    sight = context.watch<SightDetailsModel>().sights[widget.sightID];

    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
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
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _selectedPage = page.toDouble();
                          });
                        },
                        children: [
                          for (var i = 1; i <= _countOfPages; i++)
                            Container(
                              height: 300,
                              width: 300,
                              child: MyImageWidget(
                                url: sight.url,
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                      Align(
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                              child: Container(
                                color: Color(0xFF252849),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                    top: 32,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
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
                        margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: Text(
                          sight.details,
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print('построить');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                print('запланировать');
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
                                child: Row(
                                  children: [
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
                              onPressed: () {
                                print('в избранное');
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 12,
                                    ),
                                    Text(
                                      '  ${UiStrings.addToFavorites}',
                                      style: TextStyle(
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
                      SizedBox(
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

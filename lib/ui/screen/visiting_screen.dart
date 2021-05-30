import "package:flutter/material.dart";
import "../res/text_styles.dart";
import '../../mocks.dart';
import 'sight_card.dart';

class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  double _indicatorPosition = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        _indicatorPosition = _tabController.index.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _widthOfWindows = MediaQuery.of(context).size.width;
    const double _uiDefaultPadding = 16;
    const double _uiDefaultButtonHeight = 55;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Избранное',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    // Tab Indicator 1 of 3 - grey background
                    width: double.infinity,
                    height: _uiDefaultButtonHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          _uiDefaultButtonHeight / 2,
                        ),
                      ),
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  SizedBox(
                    height: _uiDefaultButtonHeight,
                    child: Row(
                      children: [
                        // Tab Indicator 2 of 3- margin for animation
                        SizedBox(
                          width:
                              ((_widthOfWindows - 2 * _uiDefaultPadding) / 2) *
                                  _indicatorPosition,
                        ),
                        // Tab Indicator 3 of 3 - colorful indicator
                        SizedBox(
                          width:
                              ((_widthOfWindows - 2 * _uiDefaultPadding) / 2),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  _uiDefaultButtonHeight / 2,
                                ),
                              ),
                              color: Theme.of(context).selectedRowColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _tabController.animateTo(0);
                            setState(() {
                              _indicatorPosition = 0;
                            });
                          },
                          child: Container(
                            height: _uiDefaultButtonHeight,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(_uiDefaultPadding),
                            child: Text(
                              'Хочу посетить',
                              style: TextStyle(
                                color: _indicatorPosition == 0
                                    ? Theme.of(context).canvasColor
                                    : Theme.of(context).primaryColorLight,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _tabController.animateTo(1);
                            setState(() {
                              _indicatorPosition = 1;
                            });
                          },
                          child: Container(
                            height: _uiDefaultButtonHeight,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Посетил',
                              style: TextStyle(
                                color: _indicatorPosition == 0
                                    ? Theme.of(context).primaryColorLight
                                    : Theme.of(context).canvasColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: DefaultTabController(
          length: 2,
          child: TabBarView(
            controller: _tabController,
            children: [
              Tab(
                child: Tab1(),
              ),
              Tab(
                child: Tab2(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.monochrome_photos,
                color: Colors.grey.shade300,
                size: 40,
              ),
              Text('Пусто',
                  style: tsVisitingScreenNoItemsHeader,
                  textAlign: TextAlign.center),
              Text(
                'Отмечайте понравившиеся места \nи они появятся здесь',
                style: tsVisitingScreenNoItemsText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SightCard(mocks[0], cartType: 'seen'),
                SightCard(mocks[1], cartType: 'seen'),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
        ),
      ],
    );
  }
}

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.monochrome_photos,
                color: Colors.grey.shade300,
                size: 40,
              ),
              Text('Пусто',
                  style: tsVisitingScreenNoItemsHeader,
                  textAlign: TextAlign.center),
              Text(
                'Отмечайте понравившиеся места \nи они появятся здесь',
                style: tsVisitingScreenNoItemsText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SightCard(mocks[1], cartType: 'wish'),
                SightCard(mocks[2], cartType: 'wish'),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
        ),
      ],
    );
  }
}

import "package:flutter/material.dart";

import '../../widgets/headers.dart';

import '3_1_tab_wished.dart';
import '3_2_tab_seen.dart';

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

    final String _header = 'Избранное';

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
              WidgetMyHeader(header: _header),
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
                child: TabWished(),
              ),
              Tab(
                child: TabSeen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

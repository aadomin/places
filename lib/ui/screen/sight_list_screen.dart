import 'package:flutter/material.dart';
import 'sight_card.dart';
import '../../domain/sight.dart';
import '../../mocks.dart';
import '../res/text_styles.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        title: Padding(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: Container(
            width: 290,
            //color: Colors.yellow.shade100,
            height: 90,
            padding: EdgeInsets.only(bottom: 10),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  style: styleH1,
                  children: [
                    TextSpan(
                      text: 'Список интересных мест',
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SightCard(mocks[0], cartType: 'general'),
            SightCard(mocks[1], cartType: 'general'),
            SightCard(mocks[2], cartType: 'general'),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '4',
          ),
        ],
      ),
    );
  }
}

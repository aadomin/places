import 'package:flutter/material.dart';
import '../elements/sight_card.dart';
import '../../mocks.dart';

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
            height: 90,
            padding: EdgeInsets.only(bottom: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                text: 'Список интересных мест',
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
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
    );
  }
}

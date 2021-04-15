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
            padding: EdgeInsets.only(bottom:10),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SightCard(mocks[0]),
              SightCard(mocks[1]),
              SightCard(mocks[2]),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }
}

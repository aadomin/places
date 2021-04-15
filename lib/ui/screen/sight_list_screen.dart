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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            top: 60,
            left: 16,
            bottom: 0,
          ),
          child: SizedBox(
            height: 140,
            width: MediaQuery.of(context).size.width * 18 / 30,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SightCard(mocks[0]),
            SightCard(mocks[1]),
            SightCard(mocks[2]),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

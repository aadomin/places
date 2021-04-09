import 'package:flutter/material.dart';
import 'sight_card.dart';
import '../../domain/sight.dart';
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
          child: SizedBox(
            width: 250,
            height: 80,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                  children: [
                    TextSpan(
                      text: 'С',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    TextSpan(
                      text: 'писок ',
                    ),
                    TextSpan(
                      text: 'и',
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                    TextSpan(
                      text: 'нтересных мест',
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

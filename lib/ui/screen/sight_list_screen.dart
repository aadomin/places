import 'package:flutter/material.dart';

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
            child: Text(
              'Список интересных мест',
              maxLines: 2,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, i) {
            return Text('$i. Lorem ipsum');
          },
        ),
      ),
    );
  }
}

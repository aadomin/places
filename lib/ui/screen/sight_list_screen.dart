import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0), // here the desired height
        child: AppBar(
          title: SizedBox(
            width: 300,
            height: 100,
            child: Text(
              'Список интересных мест',
              maxLines: 2,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 50,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 77,
          itemBuilder: (context, i) {
            return Text('Lorem ispirum');
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Дом'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Работа'),
          BottomNavigationBarItem(icon: Icon(Icons.battery_full), label: 'Бар'),
        ],
        backgroundColor: Colors.blue.shade200,
        fixedColor: Colors.pink.shade200,
        unselectedItemColor: Colors.grey.shade300,
      ),
    );
  }
}

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
        title: Text('Название экрана'),
        backgroundColor: Colors.red.shade100,
        actions: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
          IconButton(icon: Icon(Icons.sd_card), onPressed: () {}),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Меню 1'),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.anchor),
                  title: Text('Меню 2'),
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(child: Text('Меню 3')),
              PopupMenuItem(child: Text('Меню 4')),
            ],
          ),
        ],
      ),
      drawer: Drawer(child: Text('3'),),
      body: Center(
        child: ListView.builder(
          itemCount: 56,
          itemBuilder: (context, i) {
            return Text('Lorem ispirum');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // action
        },
        child: Icon(Icons.money),
        backgroundColor: Colors.green.shade100,
      ),
      persistentFooterButtons: [
        TextButton(
          child: Text('Кнопка'),
          onPressed: () {},
        ),
        TextButton(
          child: Text('И еще одна'),
          onPressed: () {},
        ),
      ],
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

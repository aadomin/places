import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _a = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text(_a.toString()),
      OutlinedButton(onPressed: _do, child: const Text('do'))
    ]));
  }

  Future<void> _do() async {
    final prefs = await SharedPreferences.getInstance();

    _a = prefs.getInt('a') ?? 5;
    _a++;
    await prefs.setInt('a', _a);

    setState(() {});
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey, Flutter!',
      home: MyBodyStatefull(),
    );
  }
}

//
//
// Независимый от виджетов счетчик
class CallsCounter {
  int callsOfStatelessBuild = 0;
  int callsOfStatefullBuild = 0;
}

var callsCounter = CallsCounter();

//
//
// Stateless
class MyBodyStateless extends StatelessWidget {
  int callsOfStatelessBuild = 0;

  @override
  Widget build(BuildContext context) {
    callsCounter.callsOfStatelessBuild += 1; //Внешний счетчик
    print(
        'STATELESS. ВНЕШНИЙ СЧЕТЧИК: ВЫЗОВ №: ${callsCounter.callsOfStatelessBuild}');

    callsOfStatelessBuild += 1; //Счетчик внутри виджета -
    //            он постоянно сбрасывается, т.к. постоянно пересоздается
    print('STATELESS. СЧЕТЧИК ВНУТРИ ВИДЖЕТА: ВЫЗОВ №: $callsOfStatelessBuild');

    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}

//
//
// Statefull
class MyBodyStatefull extends StatefulWidget {
  @override
  _MyBodyStatefullState createState() => _MyBodyStatefullState();
}

class _MyBodyStatefullState extends State<MyBodyStatefull> {
  int callsOfStatefullBuild = 0; //Счетчик внутри виджета

  String runTimeTypeOfContext() {
    return context.runtimeType.toString();
  }

  @override
  Widget build(BuildContext context) {
    callsCounter.callsOfStatefullBuild += 1; //Внешний счетчик
    print(
        'STATEFULL. ВНЕШНИЙ СЧЕТЧИК: ВЫЗОВ №: ${callsCounter.callsOfStatefullBuild}');

    callsOfStatefullBuild += 1; //Счетчик внутри виджета
    print('STATEFULL. СЧЕТЧИК ВНУТРИ ВИДЖЕТА: ВЫЗОВ №: $callsOfStatefullBuild');

    print('Тип объекта context = ${runTimeTypeOfContext()}');

    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}

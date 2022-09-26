import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/my_app_and_routes_di.dart';
import 'package:provider/provider.dart';

//Providing DI container "DI()"
class DIProvider extends StatelessWidget {
  const DIProvider(
    this.di, {
    Key? key,
  }) : super(key: key);

  final DI di;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => di,
        ),
      ],
      child: Builder(builder: (context) {
        return createMyAppAndRoutes(context: context);
      }),
    );
  }
}

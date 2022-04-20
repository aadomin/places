import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes_di.dart';
import 'package:places/di.dart';
import 'package:provider/provider.dart';

class DIProvider extends StatelessWidget {
  DIProvider({
    Key? key,
  }) : super(key: key);

  late final _di = DI();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => _di,
        ),
      ],
      child: Builder(builder: (context) {
        return createMyAppAndRoutes(context: context);
      }),
    );
  }
}

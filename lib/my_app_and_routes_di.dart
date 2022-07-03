import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/my_app_and_routes_vm.dart';
import 'package:provider/provider.dart';

MyAppAndRoutes createMyAppAndRoutes({
  required BuildContext context,
}) {
  return MyAppAndRoutes(
    viewModel: MyAppAndRoutesVM(
      context: context,
      settingsInteractor: context.read<DI>().settingsInteractor,
    ),
  );
}

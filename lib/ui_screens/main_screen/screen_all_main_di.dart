import 'package:flutter/material.dart';
import 'package:places/ui_screens/main_screen/screen_all_main.dart';
import 'package:places/ui_screens/main_screen/screen_all_main_vm.dart';

class ScreenAllMainDI extends StatelessWidget {
  const ScreenAllMainDI({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenAllMain(
      viewModel: ScreenAllMainVM(
        context: context,
      ),
    );
  }
}

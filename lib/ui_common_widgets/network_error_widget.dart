import 'package:flutter/material.dart';
import 'package:places/ui_commons/ui_strings.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: 3.14 / 4,
            child: const Icon(
              Icons.add_circle_outline,
              size: 80,
              color: Color(0xFFBBBBBB),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            UiStrings.error,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF777777),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            UiStrings.somethingWentWrong,
            style: TextStyle(color: Color(0xFF777777)),
          ),
          const SizedBox(height: 4),
          const Text(
            UiStrings.trySometimesLater,
            style: TextStyle(color: Color(0xFF777777)),
          ),
        ],
      ),
    );
  }
}

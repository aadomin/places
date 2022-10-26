import 'package:flutter/material.dart';

/// Rotating child in infinite loop widget
class MyInfiniteRotator extends StatefulWidget {
  const MyInfiniteRotator({required this.child, super.key});
  final Widget child;

  @override
  State<MyInfiniteRotator> createState() => _MyInfiniteRotatorState();
}

class _MyInfiniteRotatorState extends State<MyInfiniteRotator> {
  late double turns = 0;

  @override
  Widget build(BuildContext context) {
    // the homework task was to implement indicator in implicit animations
    // that's the reason that weird next line:
    WidgetsBinding.instance.addPostFrameCallback((_) => _asyncIncrementor());

    return AnimatedRotation(
      turns: turns,
      duration: const Duration(seconds: 1),
      child: widget.child,
    );
  }

  void _asyncIncrementor() async {
    turns++;

    if (turns == 1) {
      // when it's first pass do not wait
      await Future.delayed(const Duration(microseconds: 1));
    } else {
      await Future.delayed(const Duration(seconds: 1));
    }
    if (mounted) setState(() {});
  }
}

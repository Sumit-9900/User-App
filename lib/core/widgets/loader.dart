import 'package:flutter/material.dart';

/// A Loader widget class that shows a adaptive Circular Progress Indicator
class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}

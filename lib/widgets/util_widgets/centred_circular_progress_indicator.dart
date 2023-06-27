import 'package:flutter/material.dart';

class CentredCircularProgressIndicator extends StatelessWidget {
  final double width = 100;
  const CentredCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, child: const Center(child: CircularProgressIndicator()));
  }
}

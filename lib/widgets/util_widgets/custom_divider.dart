import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double _width;
  const CustomDivider({double? width}): _width = width ?? double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: _width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black.withOpacity(0)],
        )  
      ),
    );
  }
}
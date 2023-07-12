import 'package:flutter/material.dart';

class DuckLogo extends StatelessWidget {

  double _width;
  DuckLogo({required double width}):_width = width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width:_width, child: Image.asset("assets/images/ducks/duck_yellow.png"));
  }
}
import 'package:flutter/material.dart';

class DuckLogo extends StatelessWidget {
  final double _width;
  late final String _imagePath;
  DuckLogo.black({required double width}):_width = width,_imagePath = "assets/images/ducks/duck_black.png";
  DuckLogo.yellow({required double width}):_width = width,_imagePath = "assets/images/ducks/yellow.png";
  DuckLogo.grey({required double width}):_width = width,_imagePath = "assets/images/ducks/duck_grey.png";
  DuckLogo.primary({required double width}):_width = width,_imagePath = "assets/images/ducks/duck_primary.png";
  @override
  Widget build(BuildContext context) {
    return SizedBox(width:_width, height: _width, child: Image.asset(_imagePath));
  }
}
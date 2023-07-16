import 'package:flutter/material.dart';

class CircularImageWithLaoder extends StatelessWidget {
  Image _image;
  double _diameter;
  CircularImageWithLaoder({required Image image, required double diameter}):
    _diameter = diameter,
    _image = image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircularProgressIndicator(),
        SizedBox( 
          width: _diameter,
          height: _diameter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child:FittedBox(
              fit: BoxFit.cover,
              child: _image,
            ),
          ),
        ),
      ],
    );
  }
}
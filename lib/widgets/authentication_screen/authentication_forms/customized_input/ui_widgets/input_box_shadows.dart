import 'package:flutter/material.dart';

class InputBoxShadows{
  static List<BoxShadow> getInputBoxShadows(){
    return [
      const BoxShadow(
        color: Colors.black26,
        blurRadius: 15,
        offset: Offset(0,5),
      )
    ];
  }
}
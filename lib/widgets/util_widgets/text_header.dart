import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  final String _text;
  const TextHeader(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: Text(
        _text,
        textAlign: TextAlign.center,  
        style: TextStyle(fontSize: 25, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.w700), 
    )
    );
  }
}
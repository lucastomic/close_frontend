import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';

class NavigableButton extends StatelessWidget {
  final String _text;
  final String _path;

  NavigableButton(this._text,this._path);

  @override
  Widget build(BuildContext context) {
    return DecoratedButton.primaryColor(
      context: context, 
      text: _text,
      onPressed: (){
        Navigator.of(context).pushNamed(_path);
      },
    );
  }
}

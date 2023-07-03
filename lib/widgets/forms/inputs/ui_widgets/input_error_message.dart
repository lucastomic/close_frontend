import 'package:flutter/material.dart';
class InputErrorMessage extends StatelessWidget {
  const InputErrorMessage(this._message);
  final String _message;

  @override
  Widget build(BuildContext context) {
    return Text(
        _message,
        style: TextStyle(color:Theme.of(context).colorScheme.error),
    );
  }
}
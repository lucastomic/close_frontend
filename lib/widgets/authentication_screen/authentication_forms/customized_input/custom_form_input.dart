import 'package:flutter/material.dart';

import 'decorated_input_container.dart';

class CustomFormInput extends StatefulWidget {
  @override
  State<CustomFormInput> createState() => CustomFormInputState();

  final String? Function(String?) validate;
  final String hintText;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final GlobalKey key;

  const CustomFormInput({
    required this.validate,
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.key,
    this.obscureText = false,
  });
}

class CustomFormInputState extends State<CustomFormInput> {
  String _value = "";

  @override
  Widget build(BuildContext context) {
    return DecoratedInputContainer(
      child: TextFormField(
        validator: widget.validate,
        autocorrect: false,
        obscureText: widget.obscureText,
        keyboardType: TextInputType.emailAddress,
        decoration: _getInputDecoration(),
        onChanged: _onChanged,
      ),
    );
  }

  void _onChanged(String value) {
    _value = value;
  }

  String get value => _value;

  InputDecoration _getInputDecoration(){
      return InputDecoration(
        border:InputBorder.none ,
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color:Colors.grey
        ),
        prefixIcon:  Icon(widget.icon),
      );
  }
}

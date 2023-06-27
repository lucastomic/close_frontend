import 'package:flutter/material.dart';

import 'decorated_input_container.dart';
import 'input_error_message.dart';

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
  String? _errorMessage;

  void validate(){
    setState(() {
      _errorMessage = widget.validate(_value);
    });  
  }
  bool isValid(){
    return _errorMessage == null;  
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedInputContainer(
          child: TextFormField(
            autocorrect: false,
            obscureText: widget.obscureText,
            keyboardType: TextInputType.emailAddress,
            decoration: _getInputDecoration(),
            onChanged: _onChanged,
          ),
        ),
        _showErrorMessageIfExists()
      ],
    );
  }

  Widget _showErrorMessageIfExists(){
    return _errorMessage != null ? InputErrorMessage(_errorMessage!) : Container();
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
        labelStyle: TextStyle(
          color: _getLabelColor(),
        ),
        prefixIcon: Icon(widget.icon, color:_getIconColor()),
      );
  }

  Color? _getIconColor(){
    return _errorMessage != null ? Theme.of(context).colorScheme.error: null;
  }
  Color _getLabelColor(){
    return _errorMessage != null ? Theme.of(context).colorScheme.error: Colors.grey;
  }
}


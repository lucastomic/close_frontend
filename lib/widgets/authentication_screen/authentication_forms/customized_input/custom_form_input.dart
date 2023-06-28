import 'package:flutter/material.dart';

import 'decorated_input_container.dart';
import 'input_error_message.dart';

class CustomFormInput extends StatefulWidget {
  @override
  State<CustomFormInput> createState() => CustomFormInputState();

  final String? Function(String?) _validate;
  final String _hintText;
  final String _labelText;
  final IconData _icon;
  final bool _obscureText;
  final GlobalKey<CustomFormInputState> key;

  const CustomFormInput({
    required String? Function(String?)validate,
    required String hintText,
    required String labelText,
    required IconData icon,
    required this.key,
    bool obscureText = false,
  }): _obscureText = obscureText, _icon = icon, _labelText = labelText, _hintText = hintText,_validate = validate;

  bool isValid(){
	return key.currentState!.isValid();
  }
  void validate(){
	key.currentState!.validate();
  }
  get value{
	return key.currentState!._value;
  }

}

class CustomFormInputState extends State<CustomFormInput> {
  String _value = "";
  String? _errorMessage;

  void validate(){
    setState(() {
      _errorMessage = widget._validate(_value);
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
            obscureText: widget._obscureText,
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
        hintText: widget._hintText,
        labelText: widget._labelText,
        labelStyle: TextStyle(
          color: _getLabelColor(),
        ),
        prefixIcon: Icon(widget._icon, color:_getIconColor()),
      );
  }

  Color? _getIconColor(){
    return _errorMessage != null ? Theme.of(context).colorScheme.error: null;
  }
  Color _getLabelColor(){
    return _errorMessage != null ? Theme.of(context).colorScheme.error: Colors.grey;
  }
}


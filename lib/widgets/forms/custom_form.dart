import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/widgets/forms/form_error_message_box.dart';
import 'package:close_frontend/widgets/forms/inputs/form_inputs_list.dart';
import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final FormInputsList _inputs;
  final Future<void> Function(Map<String,String>) _authenticate;
  final String _submitButtonText;

  const CustomForm({
	  required String submitButtonText,
      required FormInputsList inputs,
      required Future<void> Function(Map<String,String>) authenticate})
      : _authenticate = authenticate,
        _submitButtonText = submitButtonText,
        _inputs = inputs;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _showErrorMessageIfExists(),
          ...widget._inputs.getInputsSpacedBetween(),
          DecoratedButton.primaryColor(
            context: context,
            text: widget._submitButtonText,
            onPressed: _onSubmit,
            formIsLoading: _isLoading,
          ),
        ],
      ),
    );
  }


  void _onSubmit() {
    _cleanErrorMessage();
    _unfocusTarget();
    widget._inputs.validateAllInputs();
    if (widget._inputs.allInputsAreValid()) {
      _executeWhileLoads(_tryToAuthenticate);
    }
  }

  Widget _showErrorMessageIfExists() {
    return _errorMessage != null
        ? FormErrorMessageBox(_errorMessage!)
        : Container();
  }

  void _executeWhileLoads(Function() func) async {
    setState(() {
      _isLoading = true;
    });
    await func();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _tryToAuthenticate() async {
    try {
      await widget._authenticate(widget._inputs.getInputsValues());
    } on BadCredentialsException catch (e) {
      _updateErrorMessage(e.message);
    }
  }

  void _unfocusTarget() {
    FocusScope.of(context).unfocus();
  }

  void _cleanErrorMessage() {
    setState(() {
      _errorMessage = null;
    });
  }

  void _updateErrorMessage(String message) {
    setState(() {
      _errorMessage = message;
    });
  }
}

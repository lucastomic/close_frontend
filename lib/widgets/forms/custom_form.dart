import 'package:close_frontend/exceptions/exception_with_message.dart';
import 'package:close_frontend/widgets/forms/form_error_message_box.dart';
import 'package:close_frontend/widgets/forms/inputs/form_inputs_list.dart';
import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';

/// T is the ID type asigned to every input, and I the type of its value
class CustomForm<T,I> extends StatefulWidget {
  final FormInputsList<T,I> _inputs;
  final Future<void> Function(Map<T,I>) _onSubmit;
  final String _submitButtonText;

  const CustomForm({
	  required String submitButtonText,
      required FormInputsList<T,I> inputs,
      required Future<void> Function(Map<T,I>) onSubmit})
      : _onSubmit = onSubmit,
        _submitButtonText = submitButtonText,
        _inputs = inputs;

  @override
  State<CustomForm> createState() => _CustomFormState<T,I>();
}

class _CustomFormState<T,I> extends State<CustomForm<T,I>> {
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      await widget._onSubmit(widget._inputs.getInputsValues());
    } on ExceptionWithMessage catch (e) {
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

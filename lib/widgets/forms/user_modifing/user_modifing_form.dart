import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/forms/custom_form.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input_list/form_inputs_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModifingForm<T,I> extends StatefulWidget {
  final FormInputsList<T,I> _inputs;
  final Future<void> Function(Map<T,I>) _execModifing;
  final String _submitButtonText;
  final String? _nextPage;

  const UserModifingForm({
    required String submitButtonText,
    required FormInputsList<T,I> inputs,
    required Future<void> Function(Map<T,I>) onSubmit,
    String? nextPage //If it's omitted it will Pop to the previous page as default
  })
    : _execModifing = onSubmit,
      _submitButtonText = submitButtonText,
      _nextPage = nextPage,
      _inputs = inputs;

  @override
  State<UserModifingForm<T,I>> createState() => _UserModifingFormState<T,I>();
}

class _UserModifingFormState<T,I> extends State<UserModifingForm<T,I>> {
  late final AuthenticationProvider _authenticationProvider;
  @override
  void initState() {
    _authenticationProvider = context.read<AuthenticationProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomForm<T,I>(
      inputs: widget._inputs, 
      submitButtonText: widget._submitButtonText,   
      onSubmit: _onSubmit
    );
  }

  Future<void> _onSubmit(Map<T,I> inputs)async{
    await widget._execModifing(inputs);
    await _authenticationProvider.refreshUser();
    _goToNextPage();
  }

  void _goToNextPage(){
    widget._nextPage!= null 
    ? Navigator.of(context).pushNamed(widget._nextPage!)
    : Navigator.of(context).pop();
  }
}
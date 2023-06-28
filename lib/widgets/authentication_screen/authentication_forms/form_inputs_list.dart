import 'package:flutter/material.dart';

import 'customized_input/custom_form_input.dart';

class FormInputsList {
  final Map<String, CustomFormInput> _inputs;

  FormInputsList(this._inputs);

  void validateAllInputs() {
    for (var input in _inputs.values) {
      input.validate();
    }
  }

  bool allInputsAreValid() {
    for (var input in _inputs.values) {
      if (!input.isValid()) return false;
    }
    return true;
  }

  Map<String,String> getInputsValues() {
	Map<String,String> response = {};
	_inputs.forEach((inputName, input) {
	  response.addAll({inputName:input.value});
	});
	return response;
  }

  List<Widget> getInputsSpacedBetween() {
    List<Widget> response = [];
    for (var input in _inputs.values) {
      response.add(input);
      response.add(const SizedBox(height: 30));
    }
    return response;
  }
}

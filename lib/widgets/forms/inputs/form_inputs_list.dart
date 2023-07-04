import 'package:flutter/material.dart';

import 'form_input.dart';

class FormInputsList<T,I> {
  final Map<T, FormInput> _inputs;

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

  Map<T,I> getInputsValues() {
    Map<T,I> response = {};
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

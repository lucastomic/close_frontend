import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:flutter/material.dart';

import 'form_inputs_list.dart';

class ExpandedFormInputsList<T,I> extends FormInputsList<T,I>{
  final Map<T, FormInput<I>> _inputs;
  
  ExpandedFormInputsList(this._inputs): super(_inputs);

  @override
  Widget renderInputs() {
    List<Widget> response = [];
    for (var input in _inputs.values) {
      response.add(input);
    }
    return Expanded(  
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: response,
      )
    );
  }
}
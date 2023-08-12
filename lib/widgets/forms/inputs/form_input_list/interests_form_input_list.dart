import 'package:close_frontend/widgets/forms/inputs/form_input.dart';
import 'package:close_frontend/widgets/forms/inputs/form_input_list/form_inputs_list.dart';
import 'package:close_frontend/widgets/interests_screen/interest_selction_form/other_interest_form/other_interest_form.dart';
import 'package:flutter/material.dart';

class InterestsFormInputsList extends FormInputsList<String,bool>{
  final Map<String, FormInput<bool>> _inputs;
  final void Function(String) _addNewInterestToUser;

  InterestsFormInputsList(this._inputs,this._addNewInterestToUser):super(_inputs);

  @override
  Widget renderInputs() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OtherInterestForm(_addNewInterestToUser),
          _AlternateExpandedGrid(_inputs.values),
        ],
      ),
    );
  }
}

class _AlternateExpandedGrid extends StatelessWidget {
  final Iterable<Widget> _children;
  _AlternateExpandedGrid(this._children);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getRows(),
    );
  }

  List<Widget> _getRows(){
    List<Widget> res = [];
    int iterations = 0;
    for (var i = 0; i < _children.length-1; i = i+2) {
      Widget row = _isEven(iterations)? _getRowWithLeftExpanded(i) : _getRowWithRightExpanded(i);
      res.add(row);
      iterations ++;
    }
    return res;
  }
  Widget _getRowWithLeftExpanded(int firstIndex){
    return Row(
      children: [
        Expanded(child: _children.elementAt(firstIndex)),
        _children.elementAt(firstIndex+1),
      ],
    );
  }

  Widget _getRowWithRightExpanded(int firstIndex){
    return Row(
      children: [
        _children.elementAt(firstIndex),
        Expanded(child: _children.elementAt(firstIndex+1)),
      ],
    );
  }

  bool _isEven(int i){
    return i % 2 == 0;
  }
}
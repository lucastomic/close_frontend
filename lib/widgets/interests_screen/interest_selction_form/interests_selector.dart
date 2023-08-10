import 'package:flutter/material.dart';
import 'interest_selector_box.dart';

class InterestSelector extends StatefulWidget {
  final Map<String,bool> _interestsSelection;
  InterestSelector(this._interestsSelection);

  @override
  State<InterestSelector> createState() => _InterestSelectorState();
}

class _InterestSelectorState extends State<InterestSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getInterestsSelectors(),
    );
  }

  List<Widget> _getInterestsSelectors(){
    List<Widget> res = [];
    int iterations = 0;
    for (var i = 0; i < widget._interestsSelection.length-1; i = i+2) {
      Widget row = _isEven(iterations)? _getRowWithLeftExpanded(i) : _getRowWithRightExpanded(i);
      res.add(row);
      iterations ++;
    }
    return res;
  }

  Widget _getRowWithLeftExpanded(int firstIndex){
    return Row(
      children: [
        Expanded(child: _getInterestSelectorBox(firstIndex)),
        _getInterestSelectorBox(firstIndex+1),
      ],
    );
  }

  Widget _getRowWithRightExpanded(int firstIndex){
    return Row(
      children: [
        _getInterestSelectorBox(firstIndex),
        Expanded(child: _getInterestSelectorBox(firstIndex+1)),
      ],
    );
  }

  Widget _getInterestSelectorBox(int index){
    String interest = _getInterest(index);
    return widget._interestsSelection[interest]! 
    ? InterestSelectorBox.selected(interest,  (() => _toggleInterestActivation(interest)))
    : InterestSelectorBox.unselected(interest,  (() => _toggleInterestActivation(interest)));
  }

  String _getInterest(int index){
    return widget._interestsSelection.keys.elementAt(index);
  }

  void _toggleInterestActivation(String interest){
    setState(() {
      widget._interestsSelection[interest] = !widget._interestsSelection[interest]!;
    });
  }

  bool _isEven(int i){
    return i % 2 == 0;
  }

}



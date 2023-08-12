
import 'package:flutter/material.dart';

class OtherInterestForm extends StatefulWidget {
  void Function(String value) _onSubmit;
  OtherInterestForm(this._onSubmit);


  @override
  State<OtherInterestForm> createState() => _OtherInterestFormState();
}

class _OtherInterestFormState extends State<OtherInterestForm> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(border: Border(bottom:BorderSide())),
      child: Row(
        children: [
          Expanded(
            child: _TextField((value)=>_value = value)
          ),
          _SubmitButton(_execOnSubmitIFPossible)
        ],
      ),
    );
  }

  void _execOnSubmitIFPossible(){
    if(_value!=null) widget._onSubmit(_value!);
  }
}

class _TextField extends StatelessWidget {
  final void Function(String?) _onChanged;
  const _TextField(this._onChanged);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onChanged,
      decoration: const InputDecoration(
        hintText: "Otro interés",
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey)
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final void Function() _onPressed;
  const _SubmitButton(this._onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: const Icon(Icons.add_circle_sharp, color: Colors.grey,),
    );
  }
}
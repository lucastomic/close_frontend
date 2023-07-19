import 'package:flutter/material.dart';

class MessageInput extends StatefulWidget {
  void Function(String? value) _onChanged; 
  MessageInput(this._onChanged);
  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(   
        padding: const EdgeInsets.all(8),
        decoration: _getExternalDecoration(),
        child: TextField(
          maxLines: null,
          decoration: _getInputDecoration(),
          onChanged: widget._onChanged,
        ),
      )
    );
  }

  BoxDecoration _getExternalDecoration(){
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).colorScheme.secondary),
      borderRadius: BorderRadius.circular(20)
    );
  }

  InputDecoration _getInputDecoration(){
    return const InputDecoration.collapsed(  
      hintText: "Mensaje",
      border: InputBorder.none
    );
  }
}
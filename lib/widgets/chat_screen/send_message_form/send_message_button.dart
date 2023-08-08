import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:flutter/material.dart';

class SendMessageButton extends StatelessWidget {
  final String? _message;
  final IChatService _chatService;
  final User _receiver;
  final void Function()? _onSubmit;
  
  const SendMessageButton({
    required IChatService chatService,
    required User receiver,
    String? message,
    void Function()? onSubmit,
  }):
  _message = message,
  _chatService = chatService,
  _receiver =receiver,
  _onSubmit = onSubmit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: const SendMessageButtonUI(),
    );
  }
  void _onTap()async{
    if(_messageIsValid()){
      await _chatService.sendMessage(_receiver, _message!);
      executeOnSubmitIfExists();
    }
  }

  bool _messageIsValid(){
    return _message !=null && _message != "";
  }

  void executeOnSubmitIfExists(){
    if(_onSubmit != null)_onSubmit!();
  }
}

class SendMessageButtonUI extends StatelessWidget {
  const SendMessageButtonUI({super.key});
  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Icon(Icons.send,color: Theme.of(context).primaryColor,),
    );
  }
}
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:flutter/material.dart';

class SendMessageButton extends StatelessWidget {
  final String? _message;
  final IChatService _messageService;
  final User _receiver;
  
  SendMessageButton(this._message, this._messageService, this._receiver);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: const SendMessageButtonUI(),
    );
  }
  void _onTap()async{
    if(_message !=null)await _messageService.sendMessage(_receiver, _message!);
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
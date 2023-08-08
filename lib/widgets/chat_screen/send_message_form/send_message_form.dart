import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/chat_screen/send_message_form/message_input.dart';
import 'package:close_frontend/widgets/chat_screen/send_message_form/send_message_button.dart';
import 'package:flutter/material.dart';

class SendMessageForm extends StatefulWidget {
  final IChatService _chatService;
  final User _receiver;

  SendMessageForm({
    required IChatService messageService,
    required User receiver,
  }):
  _chatService = messageService,
  _receiver = receiver;

  @override
  State<SendMessageForm> createState() => _SendMessageFormState();
}

class _SendMessageFormState extends State<SendMessageForm> {
  String? _message;
  final TextEditingController _messageInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child:Padding(
        padding: const EdgeInsets.only(top:8.0,right: 8,left: 8),
        child: Row(
          children: [
            MessageInput(_updateMessage, textEditingController:  _messageInputController,),
            Container(
              margin:const EdgeInsets.symmetric(horizontal:5),
              child: SendMessageButton(
                message: _message,
                chatService: widget._chatService,
                receiver: widget._receiver,
                onSubmit: _onSent,
              )
            )
          ],
        ),
      )
    );
  }

  void _updateMessage(String?value){
    setState(() {
      _message = value;
    });
  }

  void _onSent(){
    _messageInputController.clear();
    _updateMessage(null);
  }

}


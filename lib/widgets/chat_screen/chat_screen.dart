import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/chat_screen/chat_appbar_getter.dart';
import 'package:close_frontend/widgets/chat_screen/messages_future_builder.dart';
import 'package:flutter/material.dart';

import 'send_message_form/send_message_form.dart';

class ChatScreen extends StatefulWidget {
  final User _user;
  final IChatService _messageService;

  const ChatScreen(this._user, this._messageService);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar:ChatAppBarGetter.getAppBar(context,widget._user),
      body: Column(
        children: [
          MessagesFutureBuilder(widget._messageService.getChat(widget._user)),  
          SendMessageForm(
            messageService: widget._messageService,
            receiver: widget._user,
          )
        ],
      )
    );
  }

}

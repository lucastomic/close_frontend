import 'package:close_frontend/domain/chat/chat.dart';
import 'package:close_frontend/widgets/message_screen/message_box.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  final Chat _chat;
  const MessagesList(this._chat);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _chat.amountOfMessages,
      itemBuilder: (BuildContext context, int index) { 
        return MessageBox(_chat.getMessage(index),);
      },
    );
  }
}

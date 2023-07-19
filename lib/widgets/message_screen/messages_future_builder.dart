import 'package:close_frontend/domain/chat/chat.dart';
import 'package:close_frontend/widgets/message_screen/messages_list.dart';
import 'package:flutter/material.dart';

class MessagesFutureBuilder extends StatelessWidget {
  final Future<Chat> _chatFuture;
  MessagesFutureBuilder(this._chatFuture);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _chatFuture,
      builder: (context, snapshot){
        if(snapshot.hasData){ 
          return MessagesList(snapshot.data!);
        }else{
          return Container();
        }
      } ,
    );
  }
}
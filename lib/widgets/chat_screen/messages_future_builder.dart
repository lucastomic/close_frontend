import 'package:close_frontend/domain/chat/chat.dart';
import 'package:close_frontend/widgets/chat_screen/lazy_loading_messages_list/messages_list_with_lazy_loading.dart';
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
          return MessagesListWithLazyLoading(snapshot.data!);
        }else{
          return Container();
        }
      } ,
    );
  }
}
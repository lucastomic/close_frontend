import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/chat_screen/lazy_loading_messages_list/messages_list_with_lazy_loading.dart';
import 'package:flutter/material.dart';

class ChatRendering extends StatefulWidget {
  IChatService _chatService;
  User _receiver;

  ChatRendering({required IChatService chatService, required User receiver}):
  _chatService = chatService,
  _receiver = receiver;

  @override
  State<ChatRendering> createState() => _ChatRenderingState();
}

class _ChatRenderingState extends State<ChatRendering> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:widget._chatService.getChat(widget._receiver),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return StreamBuilder(
              initialData: snapshot.data,
              stream: widget._chatService.getChatStream(context),
              builder: (context, snapshotStream) {
                return MessagesListWithLazyLoading(snapshotStream.data!);
              },
            );
          }else{
            return Expanded(child: Container(),);
          }
        },
    );
  }
}
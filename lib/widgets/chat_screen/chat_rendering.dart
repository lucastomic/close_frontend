import 'package:close_frontend/domain/chat/chat.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/widgets/chat_screen/lazy_loading_messages_list/messages_list_with_lazy_loading.dart';
import 'package:flutter/material.dart';

class ChatRenderer extends StatefulWidget {
  final IChatService _chatService;
  final User _externalUser;

  const ChatRenderer({required IChatService chatService, required User externalUser}):
  _chatService = chatService,
  _externalUser = externalUser;

  @override
  State<ChatRenderer> createState() => _ChatRendererState();
}

class _ChatRendererState extends State<ChatRenderer> {

  @override
  void dispose() {
    widget._chatService.closeChatStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:widget._chatService.getChat(widget._externalUser),
        builder:_buildChatFromFutureSnapshot,
    );
  }

  Widget _buildChatFromFutureSnapshot(BuildContext context, AsyncSnapshot snapshot){
    if(snapshot.hasData){
      return StreamBuilder<Chat>(
        initialData: snapshot.data,
        stream: widget._chatService.getChatStream(context),
        builder: (context, snapshotStream) {
          return MessagesListWithLazyLoading(snapshotStream.data!);
        },
      );
    }else{
      return Expanded(child: Container(),);
    }
  }
}
import 'package:close_frontend/domain/chat/chat.dart';
import 'package:close_frontend/widgets/chat_screen/lazy_loading_messages_list/messages_list_loader.dart';
import 'package:close_frontend/widgets/chat_screen/message_box.dart';
import 'package:flutter/material.dart';

class MessagesListWithLazyLoading extends StatefulWidget {
  final Chat _chat;
  const MessagesListWithLazyLoading(this._chat);

  @override
  State<MessagesListWithLazyLoading> createState() => _MessagesListWithLazyLoadingState();
}

class _MessagesListWithLazyLoadingState extends State<MessagesListWithLazyLoading> {
  late ScrollController _scrollController;
  late MessagesListLoader _messagesList;

  @override
  void initState() {
    _laodMessagesList();
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MessagesListWithLazyLoading oldWidget) {
    _laodMessagesList();
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        reverse: true,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: _messagesList.messagesLoaded,
        itemBuilder: (BuildContext context, int index) { 
          return MessageBox(_messagesList.messages[index],);
        },
      ),
    );
  }

  void _laodMessagesList(){
    _messagesList = MessagesListLoader(widget._chat)..loadMessages();
  }

  void _scrollListener() {
    if (_shouldLoadMessages()) {
      setState(() {
        _messagesList.loadMessages();
      });
    }
  }

  bool _shouldLoadMessages(){
    return _scrollController.position.pixels > _scrollController.position.maxScrollExtent - 50;
  }
}


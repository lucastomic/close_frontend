import 'dart:async';
import 'dart:convert';
import 'package:close_frontend/config/enviroment.dart';


import 'package:close_frontend/domain/chat/chat.dart';
import 'package:close_frontend/services/chat_service/chat_stream_service/chat_stream_service_port.dart';
import 'package:close_frontend/websockets/web_socket_listener.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:IChatStreamService)
class ChatStreamService implements IChatStreamService{
  StreamController<Chat>? _chatStreamController;
  late WebSocketClientListener _chatSubscription;

  @override
  Stream<Chat> getChatStream(BuildContext context){
    _chatStreamController = StreamController<Chat>(); 
    _initializeSubscription(context);
    return _chatStreamController!.stream;
  }

  @override
  void closeChatStream(){
    _chatSubscription.unsuscribe();
  }

  void _initializeSubscription(BuildContext context){
    _chatSubscription = WebSocketClientListener.subscribe(
      context,
      destination: "/user/queue/chat", 
      url:"ws://$serverURL/socket", 
      callback: _onChatReceived
    );
  }

  void _onChatReceived(String? frameBody){
    final chatJSON = jsonDecode(frameBody!);
    Chat chat = Chat.fromJSON(chatJSON);
    _chatStreamController!.add(chat);      
  }
}
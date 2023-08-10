import 'dart:async';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/exceptions/internal_server_error.dart/internal_server_error.dart';
import 'package:close_frontend/exceptions/internet_connection/internet_connection_exception.dart';
import 'package:close_frontend/exceptions/timeout/timeout_exception.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:close_frontend/services/chat_service/chat_stream_service/chat_stream_service_port.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/chat/chat.dart';

@Injectable(as: IChatService)
class ChatService implements IChatService{
  final IChatStreamService _streamService;
  ChatService(this._streamService);

  @override
  Future<void> sendMessage(User user, String message)async {
    try{
      HTTPRequest request = HTTPRequest.toServer(
        unencodedPath: "/chat/send",
        body: <String,dynamic>{"receiverID":user.id.toString(),"value":message}
      );
      await HTTPRequester.post(request);
    }catch(e){
      rethrow;
    }
  }
  
  @override
  Future<Chat> getChat(User receiver) async {
    try{
      HTTPRequest request = HTTPRequest.toServer(
        unencodedPath: "/chat/get/${receiver.id}",
      );
      HTTPResponse response = await HTTPRequester.get(request);
      return Chat.fromJSON(response.body);
    }catch(e){
      rethrow;
    }
  }

  @override
  Stream<Chat> getChatStream(BuildContext context) {
    return _streamService.getChatStream(context);
  }
  @override
  void closeChatStream() {
      _streamService.closeChatStream();
  }
}
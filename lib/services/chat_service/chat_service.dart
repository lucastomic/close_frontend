import 'dart:async';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/exceptions/internal_server_error.dart/internal_server_error.dart';
import 'package:close_frontend/exceptions/internet_connection/internet_connection_exception.dart';
import 'package:close_frontend/exceptions/timeout/timeout_exception.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/services/chat_service/chat_service_port.dart';
import 'package:injectable/injectable.dart';

import '../../domain/chat/chat.dart';

@Injectable(as: IChatService)
class ChatService implements IChatService{

  @override
  Future<void> sendMessage(User user, String message)async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/chat/send",
      body: <String,dynamic>{"receiverID":user.id.toString(),"value":message}
    );
    HTTPResponse response = await HTTPRequester.post(request);
    if(!response.statusIsOK){
      throw _getException(response);
    }
  }
  
  @override
  Future<Chat> getChat(User receiver) async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/chat/get/${receiver.id}",
    );
    HTTPResponse response = await HTTPRequester.get(request);
    if(!response.statusIsOK){
      throw _getException(response);
    }
    return Chat.fromJSON(response.body);
  }

  Exception _getException(HTTPResponse response){
    if(response.statusIsTimeout)return RenderizableTimeOutException();
    if(response.connectionError)return InternetConnectionException();
    return InternalServerErrorException();
  }
  
  @override
  Stream<Chat> getChatStream() {
    // TODO: implement getChatStream
    throw UnimplementedError();
  }
}
import 'dart:async';
import 'dart:convert';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/exceptions/internal_server_error.dart/internal_server_error.dart';
import 'package:close_frontend/exceptions/internet_connection/internet_connection_exception.dart';
import 'package:close_frontend/exceptions/timeout/timeout_exception.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_requester.dart';
import 'package:close_frontend/http/http_response.dart';

class MessageService{
  Future<void> sendMessage(User user, String message)async {
    HTTPRequest request = HTTPRequest.toServer(
      unencodedPath: "/message/send",
      body: jsonEncode({"receiverID":user.id,"message":message})
    );
    HTTPResponse response = await HTTPRequester.post(request);
    if(!response.statusIsOK){
      throw _getException(response);
    }
  }

  Exception _getException(HTTPResponse response){
    if(response.statusIsTimeout)return RenderizableTimeOutException();
    if(response.connectionError)return InternetConnectionException();
    return InternalServerErrorException();
  }

}
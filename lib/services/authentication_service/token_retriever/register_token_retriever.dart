import 'dart:convert';
import 'package:close_frontend/exceptions/authentication/bad_credentials_exception.dart';
import 'package:close_frontend/exceptions/http/server_connection_exception.dart';
import 'package:close_frontend/http/http_request.dart';
import 'package:close_frontend/http/http_response.dart';
import 'package:close_frontend/services/authentication_service/create_user_request_data.dart';
import 'package:close_frontend/services/authentication_service/token_retriever/token_retriever.dart';

class RegisterTokenRetriever{
  late final TokenRetriever _tokenRetriever;

  Future<String> getToken(CreateUserRequestData requestData) async {
    _tokenRetriever = TokenRetriever(
      _getRequest(requestData), 
      _getExceptionFromResponse
    );
    try{
      return await _tokenRetriever.getToken();
    }catch(e){
      rethrow;
    }
  } 

  HTTPRequest _getRequest(CreateUserRequestData requestData){
    return HTTPRequest.toServer(
      unencodedPath: "/auth/register", 
      body: jsonEncode(requestData.toJson()), 
      headers: {"Content-Type":"application/json"}
    );
  }

  Exception _getExceptionFromResponse(HTTPResponse response){
    if(response.statusIsConflict)throw BadCredentialsException("Ese nombre de usuario no esta disponible");
    throw ServerConnectionException();
  }
}
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

class WebSocketSender{
  late final String _destination;
  late StompClient _client;
  late String _authenticationToken;

  WebSocketSender(BuildContext context, {required String destination,required String url}): _destination = destination
  {
    AuthenticationProvider provider =  context.read<AuthenticationProvider>();
    _authenticationToken = provider.authenticationToken;
    _client = StompClient(
      config: StompConfig(
        webSocketConnectHeaders: {
          "Authorization": "Bearer $_authenticationToken}"
        },
        url:url,
      )
    );
    _client.activate();
  }

  void send({
      Map<String, String>? headers,
      required String body,
  }) async {
    Map<String,String>? authenticatedHeaders = _getAuthenticatedHeaders(headers);
    _client.send(destination: _destination,body: body, headers: authenticatedHeaders);
  }

  Map<String,String> _getAuthenticatedHeaders(Map<String,String>? headers){
    if(headers != null){
      return _addAuthorizationToken(headers);
    }else{
      return {"Authorization": "Bearer $_authenticationToken"};
    }
  }

  Map<String,String> _addAuthorizationToken(Map<String,String> headers){
      headers.addAll({"Authorization": "Bearer $_authenticationToken"});
      return headers;
  }

}

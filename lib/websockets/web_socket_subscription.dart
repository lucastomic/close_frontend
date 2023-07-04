import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import '../provider/authentication/auth_provider.dart';

class WebSocketSubscription{
  late StompClient _client;
  late String _authenticationToken;

  WebSocketSubscription(BuildContext context, String destination,String url,void Function(String?) callback){
    AuthenticationProvider provider =  context.read<AuthenticationProvider>();
    _authenticationToken = provider.authenticationToken;
    _client = StompClient(
      config: StompConfig(
        webSocketConnectHeaders: {
          "Authorization": "Bearer $_authenticationToken}"
        },
        url:url,
        onConnect: (_)=>_subscribe(destination,callback),
      )
    );
  }

  void start(){    
    _client.activate();
  } 


  void finish(){
    _client.deactivate(); 
  }

  void _subscribe(String destination, void Function(String?) callback) {
    _client.subscribe(
        headers: {
          "Authorization": "Bearer $_authenticationToken}"
        },
        destination: destination,
        callback: (StompFrame frame)=>callback(frame.body)
    );
  }
}


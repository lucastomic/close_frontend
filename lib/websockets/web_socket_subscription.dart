import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import '../provider/authentication/auth_provider.dart';

class WebSocketSubscription{
  late StompClient _client;
  late String _authenticationToken;
  late final String _destination;
  final Function(String?) _callback;
  late void Function({Map<String, String>? unsubscribeHeaders}) _unsuscribeFunction;

  WebSocketSubscription.activate(BuildContext context, {required String destination,required String url,required void Function(String?) callback}):_callback = callback, _destination = destination
  {
    AuthenticationProvider provider =  context.read<AuthenticationProvider>();
    _authenticationToken = provider.authenticationToken;
    _client = StompClient(
      config: StompConfig(
        webSocketConnectHeaders: {
          "Authorization": "Bearer $_authenticationToken}"
        },
        url:url,
        onConnect: (_)=>_subscribe(),
      )
    );
    _client.activate();
  }


  void unsuscribe(){
    _client.deactivate(); 
    _unsuscribeFunction(unsubscribeHeaders: {"simpDestination":_destination});
  }

  void _subscribe() {
    _unsuscribeFunction = _client.subscribe(
        headers: {
          "Authorization": "Bearer $_authenticationToken}"
        },
        destination: _destination,
        callback: (StompFrame frame)=>_callback(frame.body)
    );
  }
}


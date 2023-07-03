import 'dart:async';
import 'dart:convert';
import 'package:close_frontend/domain/user/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import '../provider/authentication/auth_provider.dart';

class WebSocketService{
  late StompClient _client;
  final StreamController<List<User>> _closeUsersStream = StreamController();
  late String _authenticationToken;

  WebSocketService(BuildContext context){
    AuthenticationProvider provider =  context.read<AuthenticationProvider>();
    _authenticationToken = provider.authenticationToken;
    _client = StompClient(
      config: StompConfig(
        webSocketConnectHeaders: {
          "Authorization": "Bearer $_authenticationToken}"
        },
        url: 'ws://10.0.2.2:8080/socket',
        onConnect: _onConnectCallback,
      )
    );
  }

  void start(){    
    _client.activate();
  } 

  Stream<List<User>> get closeUsersStream{
    return _closeUsersStream.stream;
  } 

  void _onConnectCallback(StompFrame connectFrame) {
    _client.subscribe(
        headers: {
          "Authorization": "Bearer $_authenticationToken}"
        },
        destination: "/user/queue/closeusers",
        callback: (StompFrame frame) {
          List<User> users = [];
          final a = jsonDecode(frame.body!);

          for(var en in a){
            users.add(User.fromJson(en));
          }
          _closeUsersStream.add(users);
        }
    );
  }


}


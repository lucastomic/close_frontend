import 'dart:async';
import 'dart:convert';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/websockets/web_socket_subscription.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ICloseUsersService)
class CloseUsersService implements ICloseUsersService {
  final StreamController<List<User>> _closeUsersStream = StreamController();

  @override
  Stream<List<User>> closeUsersStream(BuildContext context){
    WebSocketSubscription service = WebSocketSubscription(
      context,
      "/user/queue/closeusers", 
      "ws://10.0.2.2:8080/socket", 
      _onUsersReceived
    );
    service.start();
    return _closeUsersStream.stream;
  }

  @override
  void sendLocation(String latitude, String longitude) {
    // TODO: implement sendLocation
  }

  void _onUsersReceived(String? frameBody){
    List<User> users = [];
    final usersListJson = jsonDecode(frameBody!);
    for(var userJson in usersListJson){
      users.add(User.fromJson(userJson));
    }
    _closeUsersStream.add(users);      
  }
}


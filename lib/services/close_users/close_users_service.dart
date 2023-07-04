import 'dart:async';
import 'dart:convert';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/websockets/web_socket_subscription.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ICloseUsersService)
class CloseUsersService implements ICloseUsersService {
  late StreamController<List<User>>? _closeUsersStreamController;
  WebSocketSubscription? _closeUsersSubscription;

  @override
  Stream<List<User>> getCloseUsersStream(BuildContext context){
    _closeUsersStreamController = StreamController<List<User>>(); 
    if(_closeUsersSubscription == null) _subscribeToCloseUsers(context);
    return _closeUsersStreamController!.stream;
  }

  @override
  void closeCloseUsersSubscription(){
    _closeUsersSubscription!.finish();
  }

  @override
  void sendLocation(String latitude, String longitude) {
    // TODO: implement sendLocation
  }

  void _subscribeToCloseUsers(BuildContext context){
    _closeUsersSubscription = WebSocketSubscription(
      context,
      "/user/queue/closeusers", 
      "ws://10.0.2.2:8080/socket", 
      _onUsersReceived
    );
    _closeUsersSubscription!.start();
  }

  void _onUsersReceived(String? frameBody){
    List<User> users = [];
    final usersListJson = jsonDecode(frameBody!);
    for(var userJson in usersListJson){
      users.add(User.fromJson(userJson));
    }
    _closeUsersStreamController!.add(users);      
  }
}


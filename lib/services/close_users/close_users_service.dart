import 'dart:async';
import 'dart:convert';
import 'package:close_frontend/config/config.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/websockets/web_socket_listener.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ICloseUsersService)
class CloseUsersService implements ICloseUsersService {
  StreamController<List<User>>? _closeUsersStreamController;
  late WebSocketClientListener _closeUsersSubscription;

  @override
  Stream<List<User>> openCloseUsersSubscription(BuildContext context){
    _closeUsersStreamController = StreamController<List<User>>(); 
    _initializeSubscription(context);
    return _closeUsersStreamController!.stream;
  }

  @override
  void closeCloseUsersSubscription(){
    _closeUsersSubscription.unsuscribe();
  }


  void _initializeSubscription(BuildContext context){
    _closeUsersSubscription = WebSocketClientListener.subscribe(
      context,
      destination: "/user/queue/closeusers", 
      url:"ws://$serverURL/socket", 
      callback: _onUsersReceived
    );
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


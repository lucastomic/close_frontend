import 'dart:async';
import 'dart:convert';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/websockets/web_socket_subscription.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ICloseUsersService)
class CloseUsersService implements ICloseUsersService {
  StreamController<List<User>>? _closeUsersStreamController;
  late WebSocketSubscription _closeUsersSubscription;

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

  @override
  void sendLocation(String latitude, String longitude) {
    // TODO: implement sendLocation
  }

  void _initializeSubscription(BuildContext context){
    _closeUsersSubscription = WebSocketSubscription.activate(
      context,
      destination: "/user/queue/closeusers", 
      url:"ws://192.168.18.32:8080/socket", 
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


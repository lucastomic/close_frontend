import 'dart:async';
import 'dart:convert';

import 'package:close_frontend/config/enviroment.dart';


import 'package:close_frontend/services/duck_service/duck_stream_service/duck_stream_service_port.dart';
import 'package:close_frontend/services/navigation/navigation_service.dart';
import 'package:close_frontend/websockets/web_socket_listener.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IDuckStreamService)
class DuckStreamService implements IDuckStreamService{
  StreamController<int>? _duckStreamController;
  late WebSocketClientListener _chatSubscription;

  @override
  Stream<int> getDucksReceivedStream() {
    _duckStreamController = StreamController<int>(); 
    _initializeSubscription(NavigationService.navigatorKey.currentContext!);
    return _duckStreamController!.stream;
  }
  @override
  void closeStream(){
    _chatSubscription.unsuscribe();
  }

  void _initializeSubscription(BuildContext context){
    _chatSubscription = WebSocketClientListener.subscribe(
      context,
      destination: "/user/queue/duck", 
      url:"ws://$serverURL/socket", 
      callback: _onDataReceived
    );
  }

  void _onDataReceived(String? frameBody){
    final json = jsonDecode(frameBody!);
    int ducksReceived = json;
    _duckStreamController!.add(ducksReceived);      
  }


}
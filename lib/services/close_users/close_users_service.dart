import 'dart:async';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:close_frontend/websockets/web_socket_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:ICloseUsersService)
class CloseUsersService implements ICloseUsersService {
  @override
  Stream<List<User>> closeUsersStream(BuildContext context){
    WebSocketService service = WebSocketService(context);
    service.start();
    return service.closeUsersStream;
  }

  @override
  void sendLocation(String latitude, String longitude) {
    // TODO: implement sendLocation
  }
}


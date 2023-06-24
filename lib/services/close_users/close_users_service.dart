import 'dart:async';

import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class CloseUsersService implements ICloseUsersService {
  final StreamController<List<User>> _closeUsersStream = StreamController();
  @override
  Stream<List<User>> get closeUsersStream => _closeUsersStream.stream;

  CloseUsersService() {
    _initCloseUsersListening();
  }

  void _initCloseUsersListening() {
    client.activate();
  }

  @override
  void sendLocation(String latitude, String longitude) {
    // TODO: implement sendLocation
  }
}

final StompClient client = StompClient(
    config: const StompConfig(
  webSocketConnectHeaders: {
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjb29wZXJzaW5kb2ciLCJpYXQiOjE2ODc1NDAwMjQsImV4cCI6MTY4NzYyNjQyNH0.RjXEZ3arMh7e9pX2jdGwQrmadMgpTsa7SVQAHInbsG8"
  },
  url: 'ws://10.0.2.2:8080/socket',
  onConnect: onConnectCallback,
));

void onConnectCallback(StompFrame connectFrame) {
  client.subscribe(
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjb29wZXJzaW5kb2ciLCJpYXQiOjE2ODc1NDAwMjQsImV4cCI6MTY4NzYyNjQyNH0.RjXEZ3arMh7e9pX2jdGwQrmadMgpTsa7SVQAHInbsG8"
      },
      destination: "/user/queue/closeusers",
      callback: (StompFrame frame) {
        print(frame.body);
      });
}

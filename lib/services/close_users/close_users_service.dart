import 'dart:async';

import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/services/close_users/close_users_servic_port.dart';

class CloseUsersService implements ICloseUsersService {
  final StreamController<List<User>> _closeUsersStream = StreamController();

  CloseUsersService() {
    _initCloseUsersListening();
  }

  @override
  Stream<List<User>> get closeUsersStream => _closeUsersStream.stream;

  void _initCloseUsersListening() {}

  @override
  void sendLocation(String latitude, String longitude) {
    // TODO: implement sendLocation
  }
}

import 'package:close_frontend/domain/user/user.dart';
import 'package:flutter/material.dart';

abstract class ICloseUsersService {
  Stream<List<User>> closeUsersStream(BuildContext context);
  void sendLocation(String latitude, String longitude);
}

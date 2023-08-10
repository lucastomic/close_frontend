import 'package:close_frontend/domain/user/user.dart';
import 'package:flutter/material.dart';

abstract class ICloseUsersService {
  Stream<List<User>> openCloseUsersSubscription(BuildContext context);
  void closeCloseUsersSubscription();
  void sendLocation(String latitude, String longitude);
}

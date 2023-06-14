import 'package:close_frontend/domain/user/user.dart';

abstract class ICloseUsersService {
  Stream<List<User>> get closeUsersStream;
  void sendLocation(String latitude, String longitude);
}

import 'package:close_frontend/domain/user/user.dart';

abstract class IDuckService{
  Future<void> sendDuck(User user);
  Future<void> removeDuck(User user);
  Stream<int> getDucksReceivedStream();
}
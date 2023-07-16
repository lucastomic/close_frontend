import 'package:close_frontend/domain/user/user.dart';

abstract class IMessageService{
  Future<void> sendMessage(User user, String message);
}
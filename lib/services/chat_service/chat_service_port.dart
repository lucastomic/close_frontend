import 'package:close_frontend/domain/chat/chat.dart';
import 'package:close_frontend/domain/user/user.dart';

abstract class IChatService{
  Future<void> sendMessage(User user, String message);
  Future<Chat> getChat(User receiver);
  Stream<Chat> getChatStream();
}
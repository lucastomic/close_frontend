import '../../domain/user/user.dart';

class MessageNotification{
  String title;
  String body;
  User user;
  MessageNotification({required this.title,required this.body, required this.user});
}
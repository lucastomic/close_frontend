import 'package:close_frontend/domain/chat/message.dart';

import '../user/user.dart';

class Chat{
  List<User> _members = []; 
  List<Message> _messages = [];

  Chat.fromJSON(Map<String,dynamic> json){
    _initializeMembersFromJSON(json);
    _initializeMessagesFromJSON(json);
  }

  void _initializeMembersFromJSON(Map<String,dynamic> json){
    for(Map<String,dynamic> member in json["users"]! as List<Map<String,dynamic>>){
      _members.add(User.fromJson(member));
    }
  }
  void _initializeMessagesFromJSON(Map<String,dynamic> json){
    for(Map<String,dynamic> message in json["message"]! as List<Map<String,dynamic>>){
      _messages.add(Message.fromJSON(message));
    }
  }
}
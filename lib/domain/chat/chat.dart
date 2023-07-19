import 'package:close_frontend/domain/chat/message.dart';

import '../user/user.dart';

class Chat{
  final List<User> _members = []; 
  final List<Message> _messages = [];

  Chat.fromJSON(Map<String,dynamic> json){
    _initializeMembersFromJSON(json);
    _initializeMessagesFromJSON(json);
  }

  Message getMessage(int i){
    return _messages[i];  
  }

  int get amountOfMessages{
      return _messages.length;  
  }

  void _initializeMembersFromJSON(Map<String,dynamic> json){
    List usersJSON = json["users"];
    for(Map<String,dynamic> member in usersJSON ){
      _members.add(User.fromJson(member));
    }
  }
  void _initializeMessagesFromJSON(Map<String,dynamic> json){
    List messagesJSON = json["messages"];
    for(Map<String,dynamic> message in messagesJSON){
      _messages.add(Message.fromJSON(message));
    }
  }
}
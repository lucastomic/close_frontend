import 'package:close_frontend/domain/user/user.dart';

class Message{
  late String _value;
  late User _sender;

  Message.fromJSON(Map<String,dynamic> json){
    _value = json["value"];
    _sender = json["sender"];
  }
}
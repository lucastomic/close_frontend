import 'package:close_frontend/domain/user/user.dart';

class Message{
  late String _value;
  late User _sender;

  Message.fromJSON(Map<String,dynamic> json){
    _value = json["value"];
    _sender = User.fromJson(json["sender"]);
  }

  String get value{
    return _value;
  }
  User get sender{
    return _sender;
  }
}
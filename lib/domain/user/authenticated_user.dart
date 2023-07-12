import 'package:close_frontend/domain/user/user.dart';

class AuthenticatedUser extends User{
  late int _ducksReceived;
  late List<int> _ducksSent;

  AuthenticatedUser.fromJson(Map<String, dynamic> json) : super.fromJson(json){
    _ducksReceived = json["ducksReceived"];
    _ducksSent = [];
    for (var duck in json["ducksSent"]) {
      _ducksSent.add(duck["receiver"]);
    }
  }

  int get ducksReceived{
    return _ducksReceived;
  }

}
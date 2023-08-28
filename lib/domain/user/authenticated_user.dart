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

  bool hasSentDuckTo(User user){
    return _ducksSent.contains(user.id);
  }
  void addDuckSent(User user){
    _ducksSent.add(user.id!);
  }

  void removeDuckSent(User user){
    _ducksSent.remove(user.id);
  }

}
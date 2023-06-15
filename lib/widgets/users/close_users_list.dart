import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/users/user_box/user_box.dart';
import 'package:flutter/material.dart';

class CloseUsersList extends StatelessWidget {
  List<User> _users;
  CloseUsersList(List<User> users) : this._users = users;
  List<UserBox> initUserBox() {
    List<UserBox> response = [];
    for (var element in _users) {
      response.add(UserBox(element));
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...initUserBox()],
    );
  }
}

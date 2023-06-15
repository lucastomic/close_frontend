import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/close_users/user_box/user_box.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  final List<User> _users;
  const UsersList(List<User> users) : _users = users;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getUserBoxList(),
    );
  }

  List<UserBox> getUserBoxList() {
    List<UserBox> response = [];
    for (var user in _users) {
      response.add(UserBox(user));
    }
    return response;
  }
}

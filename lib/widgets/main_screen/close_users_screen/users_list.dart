import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/main_screen/close_users_screen/user_box/user_box.dart';
import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  final List<User> _users;
  const UsersList(List<User> users) : _users = users;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, int index){
          return UserBox(_users[index]);
        }
      ),
    );
  }
}

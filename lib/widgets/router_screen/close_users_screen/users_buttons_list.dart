import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/image_manage/image_quality_reducer/image_quality_reducer.dart';
import 'package:close_frontend/widgets/router_screen/close_users_screen/user_button.dart';
import 'package:flutter/material.dart';


class UsersButtonsList extends StatelessWidget {
  final List<User> _users;
  final ImageQualityReducer _qualityReducer;
  const UsersButtonsList(List<User> users, ImageQualityReducer qualityReducer) : _users = users, _qualityReducer = qualityReducer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, int index){
          return UserButton(
            _users[index],
            _qualityReducer
          );
        }
      ),
    );
  }
}

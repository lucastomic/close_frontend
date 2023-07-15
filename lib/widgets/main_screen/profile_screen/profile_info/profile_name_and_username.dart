import 'package:close_frontend/domain/user/user.dart';
import 'package:flutter/material.dart';

class ProfileNameAndUsername extends StatelessWidget {
  final User _user;
  const ProfileNameAndUsername(this._user);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getProfileNameWidget(_user.profileName!),
        _getUsernameWidget(_user.username),
      ],
    );
  }

  Widget _getUsernameWidget(String username){
    return Text(
      username,
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget _getProfileNameWidget(String name){
    return Text(
      name,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}


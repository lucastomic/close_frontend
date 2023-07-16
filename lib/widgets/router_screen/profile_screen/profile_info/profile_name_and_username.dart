import 'package:close_frontend/domain/user/user.dart';
import 'package:flutter/material.dart';

class ProfileNameAndUsername extends StatelessWidget {
  final User _user;
  final double _usernameFontSize;
  final double _profileNameFontSize;
  
  ProfileNameAndUsername(
    this._user,
    {double usernameFontSize = 20,
    double profileNameFontSize = 25}
  ):_usernameFontSize = usernameFontSize ,
    _profileNameFontSize = profileNameFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getProfileNameWidget(_user.profileName),
        _getUsernameWidget(_user.username),
      ],
    );
  }

  Widget _getUsernameWidget(String username){
    return Text(
      username,
      style: TextStyle(fontSize: _usernameFontSize),
    );
  }

  Widget _getProfileNameWidget(String name){
    return Text(
      name,
      style: TextStyle(fontSize: _profileNameFontSize, fontWeight: FontWeight.bold),
    );
  }
}


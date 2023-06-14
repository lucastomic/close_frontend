import 'package:flutter/material.dart';

import '../../domain/user/user.dart';

class UserInformationColumn extends StatelessWidget {
  final User _user;
  UserInformationColumn(this._user);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_user.profileName!),
          Text(_user.username!),
        ],
      ),
    );
  }
}

import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_info/profile_name_and_username.dart';
import 'package:flutter/material.dart';

import 'photo_button_to_edit_profile.dart';

class BasicProfileInfo extends StatelessWidget {
  final User _user;
  const BasicProfileInfo(this._user);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PhotoButtonToEditProfile(_user.presentationImage),
        Expanded(child: ProfileNameAndUsername(_user))
      ],
    );
  }
}


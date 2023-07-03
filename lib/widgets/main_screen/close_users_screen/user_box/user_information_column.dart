import 'package:flutter/material.dart';
import '../../../../domain/user/user.dart';
import 'social_networks_list.dart';

class UserInformationColumn extends StatelessWidget {
  final User _user;
  const UserInformationColumn(this._user);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_user.profileName!),
          Text(_user.username),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: SocialNetworksList(_user.socialNetworks),
              ),
            )
          )
        ],
      ),
    );
  }
}

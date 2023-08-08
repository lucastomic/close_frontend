import 'package:flutter/material.dart';
import '../../../../domain/user/user.dart';
import '../../../util_widgets/social_networks_list.dart';

class UserInformationColumn extends StatelessWidget {
  final User _user;
  const UserInformationColumn(this._user);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_user.profileName, style: TextStyle(fontSize: 20),),

          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: SocialNetworksList(_user.socialNetworks, maxSocialNetworksDisplayed: 3,),
              ),
            )
          )
        ],
      ),
    );
  }
}

import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_info/profile_name_and_username.dart';
import 'package:flutter/material.dart';

import 'photo_button_to_edit_profile.dart';

class BasicProfileInfo extends StatelessWidget {
  final User _user;
  final double _height = 250;
  const BasicProfileInfo(this._user);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      decoration: _getDecoration(context),
      child:  Row(
        children: [
          const SizedBox(width: 15,),
          PhotoButtonToEditProfile(_user.presentationImage),
          Expanded(child: ProfileNameAndUsername(_user))
        ],
      ),
    );
  }

  BoxDecoration _getDecoration(BuildContext context){
    return BoxDecoration(  
      gradient: LinearGradient(
        colors: [
          Theme.of(context).colorScheme.onPrimary, 
          Theme.of(context).colorScheme.background ,     
        ],
        begin:Alignment.topCenter, 
        end:Alignment.bottomCenter, 
      )
    );
  }

}


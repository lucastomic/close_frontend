import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/main_screen/profile_screen/profile_info/basic_profile_info.dart';
import 'package:close_frontend/widgets/main_screen/profile_screen/buttons/log_out_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'buttons/modify_social_networks_button.dart';
import 'ducks_received_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
    User user = authenticationProvider.authenticatedUser;
    return CustomScrollView(  
      slivers: [
        SliverFillRemaining(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                BasicProfileInfo(user),
                DucksReceivedBox(),
                ModifySocialNetworksButton(), 
                const LogOutButton()
            ],
          ),
        ),
      ],
    );
  }
}

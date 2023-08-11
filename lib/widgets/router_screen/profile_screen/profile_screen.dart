import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/profile_info/basic_profile_info.dart';
import 'package:close_frontend/widgets/router_screen/profile_screen/buttons/log_out_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'buttons/navigable_button.dart';
import 'ducks_received_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User user;

  @override
  void initState() {
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
    user = authenticationProvider.authenticatedUser;    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(  
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                BasicProfileInfo(user),
                DucksReceivedBox(), 
                const Spacer(),
                NavigableButton("Modificar intereses","modifyInterests"), 
                NavigableButton("Modificar redes sociales", "modifySocialNetworks"),
                const LogOutButton()
            ],
          ),
        ),
      ],
    );
  }
}

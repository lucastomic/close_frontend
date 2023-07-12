import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/widgets/util_widgets/circular_image_with_loader.dart';
import 'package:close_frontend/widgets/util_widgets/decored_button/decored_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ducks_received_box.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();
    User user = authenticationProvider.authenticatedUser;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                _ProfilePhoto(user),
                DucksReceivedBox(),
                _ModifySocialNetworksButton()
            ],
          ),
        ),
      ],
    );
  }
}


class _ProfilePhoto extends StatelessWidget {
  final User _user;
  _ProfilePhoto(this._user);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularImageWithLaoder(
          image: Image.network(_user.presentationImage,fit: BoxFit.cover,), 
          diameter: 200
        ),
        _ProfileUsername(_user.username)
      ],
    );
  }
}

class _ProfileUsername extends StatelessWidget {
  final String _username;
  _ProfileUsername(this._username);
  @override
  Widget build(BuildContext context) {
    return Text(
      _username,
      style: TextStyle(fontSize: 20),
    );
  }
}

class _ModifySocialNetworksButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DecoratedButton.primaryColor(
      context: context, 
      text: "Modificar redes sociales",
      onPressed: (){
        Navigator.of(context).pushNamed("socialNetworks");
      },
    );
  }
}

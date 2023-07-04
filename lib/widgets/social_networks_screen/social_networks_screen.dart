import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/domain/user/user.dart';
import 'package:close_frontend/provider/authentication/auth_provider.dart';
import 'package:close_frontend/services/social_network/port/social_network_service_port.dart';
import 'package:close_frontend/widgets/forms/custom_form.dart';
import 'package:close_frontend/widgets/forms/inputs/form_inputs_list.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_input/social_network_input.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialNetworksScreen extends StatefulWidget {
  ISocialNetworkService _socialNetworkService;
  SocialNetworksScreen(this._socialNetworkService);

  @override
  State<SocialNetworksScreen> createState() => _SocialNetworksScreenState();
}

class _SocialNetworksScreenState extends State<SocialNetworksScreen> {
  late final User authenticatedUser;

  @override
  void initState() {
    _initializeAuthenticatedUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SocialNetworksScreenHeader(), 
            Expanded(
              child: CustomForm<SocialNetwork,String?>(
                inputs: FormInputsList({
                  SocialNetwork.instagram:SocialNetworkInput(SocialNetwork.instagram, initialValue: authenticatedUser.socialNetworks[SocialNetwork.instagram]),
                  SocialNetwork.twitter:SocialNetworkInput(SocialNetwork.twitter, initialValue: authenticatedUser.socialNetworks[SocialNetwork.twitter]),
                  SocialNetwork.tiktok:SocialNetworkInput(SocialNetwork.tiktok, initialValue: authenticatedUser.socialNetworks[SocialNetwork.tiktok]),
                }),
                submitButtonText: "Guardar",
                onSubmit:(Map<SocialNetwork,String?> values)async{
                  values.forEach((socialNetwork, username) {
                    username != null ? widget._socialNetworkService.updateSocialNetwork(socialNetwork, username):
                    widget._socialNetworkService.removeSocialNetwork(socialNetwork);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      )
    );
  }

  void _initializeAuthenticatedUser(){
    authenticatedUser = context.read<AuthenticationProvider>().authenticatedUser;
  }
}

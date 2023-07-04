import 'package:close_frontend/services/social_network/port/social_network_service_port.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_form/social_network_form.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_screen_header.dart';
import 'package:flutter/material.dart';

class SocialNetworksScreen extends StatelessWidget {
  ISocialNetworkService _socialNetworkService;
  SocialNetworksScreen(this._socialNetworkService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SocialNetworksScreenHeader(), 
            Expanded(
              child: SocialNetowrksForm(_socialNetworkService),
            ),
          ],
        ),
      )
    );
  }
}

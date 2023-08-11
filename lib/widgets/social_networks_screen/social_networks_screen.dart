import 'package:close_frontend/services/social_network/port/social_network_service_port.dart';
import 'package:close_frontend/widgets/social_networks_screen/social_network_form/social_network_form.dart';
import 'package:close_frontend/widgets/util_widgets/text_header.dart';
import 'package:flutter/material.dart';

class SocialNetworksScreen extends StatelessWidget {
  ISocialNetworkService _socialNetworkService;
  final String? _nextPage;
  
  SocialNetworksScreen(
    this._socialNetworkService,
    {
      String? nextPage //If it's omitted it will Pop to the previous page as default after submiting
    }
  ):_nextPage = nextPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const TextHeader("¡Sube las redes sociales que quieras mostrar a los demás!"), 
                  Expanded(
                    child: SocialNetowrksForm(_socialNetworkService, nextPage: _nextPage,)
                  ) ,
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}

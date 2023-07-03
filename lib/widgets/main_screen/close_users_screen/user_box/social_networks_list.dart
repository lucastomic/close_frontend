
import 'dart:math';
import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:flutter/material.dart';

class SocialNetworksList extends StatelessWidget {
  final List<SocialNetwork> _socialNetworks;
  final int maxSocialNetworksDisplayed = 3;

  const SocialNetworksList(this._socialNetworks);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:  _getNumberOfSocialNetworksDisplayed(),
      itemBuilder: (_, int index){
        SocialNetwork socialNetwork = _socialNetworks[index];
        return Row(
          children: [
            SizedBox(width:15, child: socialNetwork.logo),
            const SizedBox(width: 10,),
            Text(socialNetwork.username,textAlign: TextAlign.center,),
          ],
        );
      }
    );
  }

  int _getNumberOfSocialNetworksDisplayed(){
    return min(maxSocialNetworksDisplayed, _socialNetworks.length);
  }

}

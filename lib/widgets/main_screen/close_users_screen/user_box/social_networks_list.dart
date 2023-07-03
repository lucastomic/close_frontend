
import 'dart:math';
import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class SocialNetworksList extends StatelessWidget {
  final Map<SocialNetwork,String> _socialNetworks;
  final int maxSocialNetworksDisplayed = 3;

  const SocialNetworksList(this._socialNetworks);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:  _getNumberOfSocialNetworksDisplayed(),
      itemBuilder: (_, int index){
        SocialNetwork key = _socialNetworks.keys.elementAt(index);
        return Row(
          children: [
            SizedBox(width:15, child: key.logo),
            const SizedBox(width: 10,),
            Text(_socialNetworks[key]!.asUsername(),textAlign: TextAlign.center,),
          ],
        );
      }
    );
  }

  int _getNumberOfSocialNetworksDisplayed(){
    return min(maxSocialNetworksDisplayed, _socialNetworks.length);
  }

}

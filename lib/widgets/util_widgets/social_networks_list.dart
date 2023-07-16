import 'dart:math';
import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class SocialNetworksList extends StatelessWidget {
  final Map<SocialNetwork,String> _socialNetworks;
  final int maxSocialNetworksDisplayed = 3;
  final double _logoSize;
  final double _fontSize;
  const SocialNetworksList(this._socialNetworks, {double logoSize = 18, double fontSize = 14}):
  _logoSize = logoSize, _fontSize =fontSize;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:  _getNumberOfSocialNetworksDisplayed(),
      itemBuilder: (_, int index){
        SocialNetwork key = _socialNetworks.keys.elementAt(index);
        return Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            children: [
              SizedBox(width:_logoSize, child: key.logo),
              const SizedBox(width: 7,),
              Text(
                _socialNetworks[key]!.asUsername(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _fontSize),  
              ),
            ],
          ),
        );
      }
    );
  }

  int _getNumberOfSocialNetworksDisplayed(){
    return min(maxSocialNetworksDisplayed, _socialNetworks.length);
  }

}

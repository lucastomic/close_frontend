import 'dart:math';
import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class SocialNetworksList extends StatelessWidget {
  final Map<SocialNetwork,String> _socialNetworksToUsername;
  final int? _maxSocialNetworksDisplayed;
  final double _logoSize;
  final double _fontSize;
  final double _spaceBetweenRows;
  final double _width;

  const SocialNetworksList(
    this._socialNetworksToUsername, 
    {
      double logoSize = 18, 
      double fontSize = 14, 
      double spaceBetweenRows = 4, 
      double width = double.infinity,
      int? maxSocialNetworksDisplayed
    }
  ):
  _logoSize = logoSize, _fontSize =fontSize, _maxSocialNetworksDisplayed = maxSocialNetworksDisplayed, _spaceBetweenRows = spaceBetweenRows, _width = width;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:  _getNumberOfSocialNetworksDisplayed(),
      itemBuilder: (_, int index){
        SocialNetwork socialNetwork = _socialNetworksToUsername.keys.elementAt(index);
        return Padding(
          padding: EdgeInsets.only(bottom: _spaceBetweenRows),
          child: _SocialNetworkRow(socialNetwork, _socialNetworksToUsername[socialNetwork]!, _logoSize, _fontSize),
        );
      }
    );
  }

  int _getNumberOfSocialNetworksDisplayed(){
    return _maxSocialNetworksDisplayed == null 
      ? _socialNetworksToUsername.length 
      : min(_maxSocialNetworksDisplayed!, _socialNetworksToUsername.length);
  }

}


class _SocialNetworkRow extends StatelessWidget {
  final SocialNetwork _socialNetwork;
  final double _logoSize;
  final String _username;
  final double _fontSize;
  const _SocialNetworkRow(this._socialNetwork, this._username, this._logoSize, this._fontSize);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width:_logoSize, child: _socialNetwork.logo),
        const SizedBox(width: 7,),
        Flexible(
          child: Text(
            _username.asUsername(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: _fontSize, fontWeight: FontWeight.w600),  
          ),
        ),
      ],
    );
  }
}
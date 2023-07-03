import 'package:close_frontend/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class SocialNetwork{
  final Widget logo;
  final String name;
  final String _username;   

  SocialNetwork._internal({
    required this.logo,
    required this.name,
    required String username} 
  ):_username = username;

  factory SocialNetwork(String name, String username){
    switch(name){
      case "INSTAGRAM":
        return SocialNetwork._internal(logo: Image.asset("assets/images/social_networks/instagram.png"), name: name, username: username);
      case "TIKTOK":
        return SocialNetwork._internal(logo: Image.asset("assets/images/social_networks/tiktok.png"), name: name, username: username);
      case "TWITTER":
        return SocialNetwork._internal(logo: Image.asset("assets/images/social_networks/twitter.png"), name: name, username: username);
      default:
        throw Exception("Unkown social network");
    }
  }

  String get username{
    return _username.asUsername();
  }
}
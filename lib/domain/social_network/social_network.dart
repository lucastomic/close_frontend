import 'package:flutter/material.dart';

class SocialNetwork{
  final Widget logo;
  final String name;

  SocialNetwork._internal({
    required this.logo,
    required this.name,
  });

  factory SocialNetwork(String name){
    switch(name){
      case "INSTAGRAM":
        return SocialNetwork._internal(logo: Image.asset("assets/images/social_networks/instagram.png"), name: "Instagram");
      case "TIKTOK":
        return SocialNetwork._internal(logo: Image.asset("assets/images/social_networks/tiktok.png"), name: "TikTok");
      case "TWITTER":
        return SocialNetwork._internal(logo: Image.asset("assets/images/social_networks/twitter.png"), name: "Twitter");
      default:
        throw Exception("Unkown social network");
    }
  }
}
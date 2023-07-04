
import 'package:flutter/material.dart';

enum SocialNetwork{
  twitter("Twitter","assets/images/social_networks/twitter.png"),
  tiktok("TikTok","assets/images/social_networks/tiktok.png"),
  instagram("Instagram","assets/images/social_networks/instagram.png");

  final String name;
  final String _photoPath;

  const SocialNetwork(this.name, this._photoPath);

  static SocialNetwork fromUpperCaseName(String name){
    switch(name){
      case "INSTAGRAM":
        return SocialNetwork.instagram;
      case "TWITTER":
        return SocialNetwork.twitter;
      case "TIKTOK":
        return SocialNetwork.tiktok;
      default:
        throw Exception("Undefined social network");
    }
  }

  Widget get logo{
    return Image.asset(_photoPath);
  }
}

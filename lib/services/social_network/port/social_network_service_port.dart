import 'package:close_frontend/domain/social_network/social_network.dart';

abstract class ISocialNetworkService{
  void updateSocialNetwork(SocialNetwork socialNetwork, String username);
  void removeSocialNetwork(SocialNetwork socialNetwork);
}
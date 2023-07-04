import 'package:close_frontend/domain/social_network/social_network.dart';

abstract class ISocialNetworkService{
  Future<void> updateSocialNetwork(SocialNetwork socialNetwork, String username);
  Future<void> removeSocialNetwork(SocialNetwork socialNetwork);
}
import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/extensions/string_extensions.dart';

class User {
  int? id;
  late String _username;
  late String profileName;
  String? password;
  String? photo;
  List<String>? interests;
  Map<SocialNetwork, String> socialNetworks = {};

  User({
    this.id,
    required String username,
    required this.profileName,
    this.password,
    this.photo,
    this.interests,
    this.socialNetworks = const {},
  }): this._username = username;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _username = json['username']!;
    profileName = json['profileName'!];
    password = json['password'];
    photo = json['photo'];
    socialNetworks = {};
    json['socialNetworks'].forEach((key,value){
      socialNetworks.addAll({SocialNetwork.fromUpperCaseName(key):value});
    });
    if (json['interests'] != null) {
      interests = <String>[];
      json['interests'].forEach((v) {
        interests!.add(v);
      });
    }
  }

  String get presentationImage {
    return photo!;
  }

  String get username{
    return _username.asUsername();
  }
}

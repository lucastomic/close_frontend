import 'package:close_frontend/domain/social_network/social_network.dart';
import 'package:close_frontend/extensions/string_extensions.dart';

class User {
  int? id;
  late String _username;
  String? profileName;
  int? age;
  String? password;
  String? role;
  String? phone;
  bool? phoneIsVerified;
  String? photo;
  List<String>? interests;
  Map<SocialNetwork, String> socialNetworks = {};
  bool? enabled;
  bool? accountNonExpired;
  bool? accountNonLocked;
  bool? credentialsNonExpired;

  User({
    this.id,
    required String username,
    this.profileName,
    this.age,
    this.password,
    this.role,
    this.phone,
    this.phoneIsVerified,
    this.photo,
    this.interests,
    this.enabled,
    this.accountNonExpired,
    this.accountNonLocked,
    this.socialNetworks = const {},
    this.credentialsNonExpired,
  }): this._username = username;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _username = json['username']!;
    profileName = json['profileName'];
    age = json['age'];
    password = json['password'];
    role = json['role'];
    phone = json['phone'];
    phoneIsVerified = json['phoneIsVerified'];
    photo = json['photo'];
    socialNetworks = {};
    for (var sn in json['socialNetworks']??[]) {
      socialNetworks.addAll({SocialNetwork.fromUpperCaseName(sn["socialNetwork"]):sn["username"]});
    }

    if (json['interests'] != null) {
      interests = <String>[];
      json['interests'].forEach((v) {
        interests!.add(v);
      });
    }
    enabled = json['enabled'];

    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
  }

  String get presentationImage {
    return photo!;
  }

  String get username{
    return _username.asUsername();
  }
}

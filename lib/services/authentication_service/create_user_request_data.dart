import 'package:close_frontend/domain/user/user.dart';

class CreateUserRequestData {
  int? id;
  String? username;
  String? profileName;
  int? age;
  String? password;
  String? role;
  String? phone;
  bool? phoneIsVerified;
  List<String>? photos;
  List<String>? interests;
  bool? enabled;
  bool? accountNonExpired;
  bool? accountNonLocked;
  bool? credentialsNonExpired;

  CreateUserRequestData({
    this.id,
    this.username,
    this.profileName,
    this.age,
    this.password,
    this.role,
    this.phone,
    this.phoneIsVerified,
    this.photos,
    this.interests,
    this.enabled,
    this.accountNonExpired,
    this.accountNonLocked,
    this.credentialsNonExpired,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "profileName": profileName,
        "age": age,
        "password": password,
        "role": role,
        "phone": phone,
        "phoneIsVerified": phoneIsVerified,
        "photos": photos,
        "interests": interests,
        "enabled": enabled,
        "accountNonExpired": accountNonExpired,
        "accountNonLocked": accountNonLocked,
        "credentialsNonExpired": credentialsNonExpired,
      };

  User toUser() {
    return User(
      id: this.id,
      username: this.username,
      profileName: this.profileName,
      age: this.age,
      password: this.password,
      role: this.role,
      phone: this.phone,
      phoneIsVerified: this.phoneIsVerified,
      photos: this.photos,
      interests: this.interests,
      enabled: this.enabled,
      accountNonExpired: this.accountNonExpired,
      accountNonLocked: this.accountNonLocked,
      credentialsNonExpired: this.credentialsNonExpired,
    );
  }
}

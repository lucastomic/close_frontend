import 'package:close_frontend/domain/user/user.dart';

class CreateUserRequestData {
  String? username;
  String? profileName;
  String? password;
  String? photo;
  List<String>? interests;

  CreateUserRequestData({
    this.username,
    this.profileName,
    this.password,
    this.photo,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "profileName": profileName,
        "password": password,
        "photo": photo,
        "interests": interests,
      };

  User toUser() {
    return User(
      username: this.username!,
      profileName: this.profileName,
      password: this.password,
      photo: this.photo,
      interests: this.interests,
    );
  }
}

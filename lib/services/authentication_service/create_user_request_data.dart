class CreateUserRequestData {
  String? username;
  String? profileName;
  String? password;
  String? photo;
  String? notificationDeviceid;
  List<String> interests = [];

  CreateUserRequestData({
    this.username,
    this.profileName,
    this.password,
    this.photo,
    this.notificationDeviceid
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "profileName": profileName,
        "password": password,
        "photo": photo,
        "interests": interests,
        "notificationDeviceID":notificationDeviceid
      };

}

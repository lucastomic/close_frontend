class User {
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

  User({
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    profileName = json['profileName'];
    age = json['age'];
    password = json['password'];
    role = json['role'];
    phone = json['phone'];
    phoneIsVerified = json['phoneIsVerified'];
    if (json['photos'] != null) {
      photos = <String>[];
      json['photos'].forEach((v) {
        photos!.add(v);
      });
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
}

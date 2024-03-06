class AuthModel {
  UserModel? user;
  String? lastLogin;
  String? token;
  String? refreshToken;

  AuthModel({this.user, this.lastLogin, this.token, this.refreshToken});

  AuthModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    lastLogin = json['lastLogin'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['lastLogin'] = lastLogin;
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class UserModel {
  String? id;
  String? email;
  String? firstName;
  String? lastName;

  UserModel({this.id, this.email, this.firstName, this.lastName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}

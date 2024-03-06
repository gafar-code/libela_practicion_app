import 'package:equatable/equatable.dart';

import '../../data/models/register_verify_otp.dart';

class AuthEntity extends Equatable {
  final UserEntity? user;
  final String? lastLogin;
  final String? token;
  final String? refreshToken;

  const AuthEntity({
    this.user,
    this.lastLogin,
    this.token,
    this.refreshToken,
  });

  factory AuthEntity.fromModel(AuthModel auth) {
    return AuthEntity(
      user: UserEntity.fromModel(auth.user!),
      lastLogin: auth.lastLogin,
      token: auth.token,
      refreshToken: auth.refreshToken,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'lastLogin': lastLogin,
      'token': token,
      'refreshToken': refreshToken,
    };
  }

  @override
  List<Object?> get props => [user, lastLogin, token, refreshToken];
}

class UserEntity extends Equatable {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;

  const UserEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory UserEntity.fromModel(UserModel user) {
    return UserEntity(
      id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
    );
  }

  @override
  List<Object?> get props => [id, email, firstName, lastName];

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}

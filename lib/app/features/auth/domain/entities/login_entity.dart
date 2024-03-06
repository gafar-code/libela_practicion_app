import 'package:equatable/equatable.dart';

import '../../data/models/login_response.dart';

class LoginEntity extends Equatable {
  final String? otpCode;
  final String? otpToken;
  final String? expiryAt;

  LoginEntity({this.otpCode, this.otpToken, this.expiryAt});

  factory LoginEntity.fromModel(LoginResponseModel model) {
    return LoginEntity(
      otpCode: model.otpCode,
      otpToken: model.otpToken,
      expiryAt: model.expiryAt,
    );
  }

  @override
  List<Object?> get props => [otpCode, otpToken, expiryAt];
}

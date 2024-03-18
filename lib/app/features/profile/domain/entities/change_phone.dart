import 'package:equatable/equatable.dart';

import '../../data/models/change_phone.dart';

class ChangePhoneEntity extends Equatable {
  final String? otpCode;
  final String? otpToken;
  final String? expiryAt;

  ChangePhoneEntity({this.otpCode, this.otpToken, this.expiryAt});

  factory ChangePhoneEntity.fromModel(ChangePhoneModel model) {
    return ChangePhoneEntity(
      otpCode: model.otpCode,
      otpToken: model.otpToken,
      expiryAt: model.expiryAt,
    );
  }

  @override
  List<Object?> get props => [otpCode, otpToken, expiryAt];
}

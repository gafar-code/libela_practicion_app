import 'package:equatable/equatable.dart';
import '../../data/models/register_phone.dart';

class RegisterPhoneEntity extends Equatable {
  final String? otpCode;
  final String? otpToken;
  final String? expiryAt;
  final String? phoneNumber;

  const RegisterPhoneEntity({
    this.otpCode,
    this.otpToken,
    this.expiryAt,
    this.phoneNumber,
  });

  factory RegisterPhoneEntity.fromModel(RegisterPhoneModel registerPhone) {
    return RegisterPhoneEntity(
      otpCode: registerPhone.otpCode,
      otpToken: registerPhone.otpToken,
      expiryAt: registerPhone.expiryAt,
      phoneNumber: registerPhone.phoneNumber,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'otpCode': otpCode,
      'otpToken': otpToken,
      'expiryAt': expiryAt,
      'phoneNumber': phoneNumber,
    };
  }

  RegisterPhoneEntity copyWith({
    String? phoneNumber,
  }) {
    return RegisterPhoneEntity(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [otpCode, otpToken, expiryAt, phoneNumber];
}

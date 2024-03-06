import '../../../../../core/network/param.dart';

class ForgotPhoneVerifyBody extends RequestBody {
  final String otp;
  final String otpToken;
  final String email;

  ForgotPhoneVerifyBody(
      {required this.otp, required this.otpToken, required this.email});

  @override
  Map<String, dynamic> toJson() =>
      {'otp': otp, 'otpToken': otpToken, 'email': email};
}

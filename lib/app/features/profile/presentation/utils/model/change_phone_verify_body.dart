import '../../../../../core/network/param.dart';

class ChangePhoneVerifyBody extends RequestBody {
  final String? newPhoneNumber;
  final String? otp;
  final String? otpToken;

  ChangePhoneVerifyBody(this.newPhoneNumber, this.otp, this.otpToken);
  @override
  Map<String, dynamic> toJson() => {
        'newPhoneNumber': newPhoneNumber,
        'otp': otp,
        'otpToken': otpToken
      }..removeWhere((key, value) => value == null);

  ChangePhoneVerifyBody copyWith(
      {String? newPhoneNumber, String? otp, String? otpToken}) {
    return ChangePhoneVerifyBody(newPhoneNumber, otp, otpToken);
  }
}

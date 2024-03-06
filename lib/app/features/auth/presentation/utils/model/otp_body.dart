import '../../../../../core/network/param.dart';

class SendOTPBody extends RequestBody {
  final String phoneNumber;

  SendOTPBody({required this.phoneNumber});

  @override
  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
      };
}

class VerifyOTPBody extends SendOTPBody {
  final String otp;
  final String otpToken;
  VerifyOTPBody(
      {required String phoneNumber, required this.otp, required this.otpToken})
      : super(phoneNumber: phoneNumber);

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..['otp'] = otp
    ..['otpToken'] = otpToken;
}

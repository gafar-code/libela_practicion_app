import '../../../../../core/network/param.dart';

class RegisterBody extends RequestBody {
  RegisterBody({this.phoneNumber, this.via, this.referralCode, this.fcmToken});

  final String? phoneNumber;
  final String? via;
  final String? referralCode;
  final String? fcmToken;

  @override
  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'via': via,
        'referralCode': referralCode,
        'fcmToken': fcmToken
      }..removeWhere((key, value) => value == null || value == "");

  RegisterBody copyWith(
      {String? phoneNumber,
      String? via,
      String? referralCode,
      String? fcmToken}) {
    return RegisterBody(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        via: via ?? this.via,
        referralCode: referralCode ?? this.referralCode,
        fcmToken: fcmToken ?? this.fcmToken);
  }
}

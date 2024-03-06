import '../../../../../core/network/param.dart';

class RegisterBody extends RequestBody {
  RegisterBody({this.phoneNumber, this.via, this.referralCode});

  final String? phoneNumber;
  final String? via;
  final String? referralCode;

  @override
  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'via': via,
        'referralCode': referralCode
      }..removeWhere((key, value) => value == null || value == "");

  RegisterBody copyWith({
    String? phoneNumber,
    String? via,
    String? referralCode,
  }) {
    return RegisterBody(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      via: via ?? this.via,
      referralCode: referralCode ?? this.referralCode,
    );
  }
}

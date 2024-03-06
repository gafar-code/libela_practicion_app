import '../../../../../core/network/param.dart';

class LoginBody implements RequestBody {
  final String phoneNumber;
  final String via;
  final String? fcmToken;

  LoginBody(this.phoneNumber, this.via, [this.fcmToken]);

  @override
  Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'via': via,
        'fcm_token': fcmToken,
      };

  LoginBody copyWith({
    String? phoneNumber,
    String? via,
    String? fcmToken,
  }) {
    return LoginBody(
      phoneNumber ?? this.phoneNumber,
      via ?? this.via,
      fcmToken ?? this.fcmToken,
    );
  }
}

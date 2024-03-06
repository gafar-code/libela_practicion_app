import '../../../../../core/network/param.dart';

class ForgotPhoneBody extends RequestBody {
  final String email;

  ForgotPhoneBody({required this.email});

  @override
  Map<String, dynamic> toJson() => {'email': email};
}

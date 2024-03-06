import '../../../../../core/network/param.dart';

class PasswordBody extends RequestBody {
  final String password;

  PasswordBody({required this.password});

  @override
  Map<String, dynamic> toJson() => {'password': password};
}

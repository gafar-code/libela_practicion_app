import '../../../../../core/network/param.dart';

class EmailBody extends RequestBody {
  final String email;

  EmailBody({required this.email});

  @override
  Map<String, dynamic> toJson() => {'email': email};
}

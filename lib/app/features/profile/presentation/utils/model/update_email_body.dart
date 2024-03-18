import '../../../../../core/network/param.dart';

class UpdateEmailBody extends RequestBody {
  final String email;

  UpdateEmailBody({required this.email});

  @override
  Map<String, dynamic> toJson() => {'email': email};
}

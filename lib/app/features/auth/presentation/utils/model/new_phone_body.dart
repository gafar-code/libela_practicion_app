import '../../../../../core/network/param.dart';

class NewPhoneBody extends RequestBody {
  final String phoneNumber;

  NewPhoneBody({required this.phoneNumber});

  @override
  Map<String, dynamic> toJson() => {'phoneNumber': phoneNumber};
}

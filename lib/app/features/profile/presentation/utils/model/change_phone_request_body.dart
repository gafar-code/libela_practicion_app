import '../../../../../core/network/param.dart';

class ChangePhoneRequestBody extends RequestBody {
  final String? newPhoneNumber;

  ChangePhoneRequestBody(this.newPhoneNumber);
  @override
  Map<String, dynamic> toJson() => {'newPhoneNumber': newPhoneNumber}
    ..removeWhere((key, value) => value == null);

  ChangePhoneRequestBody copyWith({String? newPhoneNumber}) {
    return ChangePhoneRequestBody(newPhoneNumber);
  }
}

import '../../../../../core/network/param.dart';

class PersonalDataBody extends RequestBody {
  final String firstName;
  final String lastName;
  final String identityNumber;
  final String dateOfBirth;
  final String gender;
  final int provinceId;
  final int cityId;
  final String address;

  PersonalDataBody({
    required this.firstName,
    required this.lastName,
    required this.identityNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.provinceId,
    required this.cityId,
    required this.address,
  });

  @override
  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "identityNumber": identityNumber,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "provinceId": provinceId,
        "cityId": cityId,
        "address": address
      };
}

import '../../../../../core/network/param.dart';

class ProfileBody extends RequestBody {
  final String firstName;
  final String lastName;
  final String? avatar;
  final String? aboutme;

  ProfileBody({
    required this.firstName,
    required this.lastName,
    this.avatar,
    this.aboutme,
  });

  @override
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'avatar': avatar,
        'aboutme': aboutme
      }..removeWhere((key, value) => value == null);
}

import '../../../../../core/network/param.dart';

class PersonalServiceAreaBody extends RequestBody {
  final List<int> serviceAreaIds;
  final List<dynamic> serviceSpecializations;

  PersonalServiceAreaBody({
    required this.serviceAreaIds,
    required this.serviceSpecializations,
  });
  @override
  Map<String, dynamic> toJson() => {
        'serviceAreaIds': serviceAreaIds,
        'serviceSpecializations': serviceSpecializations,
      };
}

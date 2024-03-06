import '../../../../../core/network/param.dart';

class ProfessionBody extends RequestBody {
  final String professionId;
  final String education;

  ProfessionBody({
    required this.professionId,
    required this.education,
  });
  @override
  Map<String, dynamic> toJson() => {
        'professionId': professionId,
        'education': education,
      };
}

import '../../../../../core/network/param.dart';

class PersonalDocumentBody extends RequestBody {
  final String str;
  final String sip;
  final String ktp;

  PersonalDocumentBody({
    required this.str,
    required this.sip,
    required this.ktp,
  });
  @override
  Map<String, dynamic> toJson() => {'str': str, 'sip': sip, 'ktp': ktp};
}

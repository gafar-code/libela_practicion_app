import '../../../../../core/network/param.dart';

class DeleteBankAccountBody extends RequestBody {
  final String? bankAccount;

  DeleteBankAccountBody({this.bankAccount});
  @override
  Map<String, dynamic> toJson() => {'bankAccount': bankAccount}
    ..removeWhere((key, value) => value == null || value == '');
}

import '../../../../../core/network/param.dart';

class BankAccountBody extends RequestBody {
  final int? bankId;
  final String? bankAccount;
  final String? bankAccountName;
  final int? isPrimary;

  BankAccountBody(
      {this.bankId, this.bankAccount, this.bankAccountName, this.isPrimary});
  @override
  Map<String, dynamic> toJson() => {
        'bankId': bankId,
        'bankAccount': bankAccount,
        'bankAccountName': bankAccountName,
        'isPrimary': isPrimary
      }..removeWhere((key, value) => value == null || value == '');

  BankAccountBody copyWith(
      {int? bankId,
      String? bankAccount,
      String? bankAccountName,
      int? isPrimary}) {
    return BankAccountBody(
        bankId: bankId ?? this.bankId,
        bankAccount: bankAccount ?? this.bankAccount,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        isPrimary: isPrimary ?? this.isPrimary);
  }
}

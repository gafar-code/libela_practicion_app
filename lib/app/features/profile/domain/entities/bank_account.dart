import 'package:equatable/equatable.dart';

import '../../data/models/bank_account.dart';

class BankAccountEntity extends Equatable {
  final int? id;
  final int? bankId;
  final String? bankAccount;
  final String? bankAccountName;
  final int? isPrimaryBank;
  final String? bankName;
  final String? bankCode;
  final String? bankAlias;
  final String? bankColor;

  BankAccountEntity(
      {this.id,
      this.bankId,
      this.bankAccount,
      this.bankAccountName,
      this.isPrimaryBank,
      this.bankName,
      this.bankCode,
      this.bankAlias,
      this.bankColor});

  factory BankAccountEntity.fromModel(BankAccountModel model) {
    return BankAccountEntity(
      id: model.id,
      bankId: model.bankId,
      bankAccount: model.bankAccount,
      bankAccountName: model.bankAccountName,
      isPrimaryBank: model.isPrimaryBank,
      bankName: model.bankName,
      bankCode: model.bankCode,
      bankAlias: model.bankAlias,
      bankColor: model.bankColor,
    );
  }

  BankAccountEntity copyWith(
      {int? id,
      int? bankId,
      String? bankAccount,
      String? bankAccountName,
      int? isPrimaryBank,
      String? bankName,
      String? bankCode,
      String? bankAlias,
      String? bankColor}) {
    return BankAccountEntity(
      id: id ?? this.id,
      bankId: bankId ?? this.bankId,
      bankAccount: bankAccount ?? this.bankAccount,
      bankAccountName: bankAccountName ?? this.bankAccountName,
      isPrimaryBank: isPrimaryBank ?? this.isPrimaryBank,
      bankName: bankName ?? this.bankName,
      bankCode: bankCode ?? this.bankCode,
      bankAlias: bankAlias ?? this.bankAlias,
      bankColor: bankColor ?? this.bankColor,
    );
  }

  @override
  List<Object?> get props => [
        id,
        bankId,
        bankAccount,
        bankAccountName,
        isPrimaryBank,
        bankName,
        bankCode,
        bankAlias,
        bankColor
      ];
}

import 'package:equatable/equatable.dart';
import 'package:libela_practition/app/features/wallet/data/models/transaction_history.dart';

class TransactionHistoryEntity extends Equatable {
  final String? id;
  final String? financeId;
  final String? walletId;
  final String? item;
  final int? amount;
  final String? transactionType;
  final String? transactionStatus;
  final String? transactionLineType;
  final String? transactionCode;
  final String? bankName;
  final String? bankCode;
  final String? accountNumber;
  final String? accountName;
  final String? accountIdentity;
  final String? accountPhoneNumber;
  final String? createdAt;

  TransactionHistoryEntity(
      {this.id,
      this.financeId,
      this.walletId,
      this.item,
      this.amount,
      this.transactionType,
      this.transactionStatus,
      this.transactionLineType,
      this.transactionCode,
      this.bankName,
      this.bankCode,
      this.accountNumber,
      this.accountName,
      this.accountIdentity,
      this.accountPhoneNumber,
      this.createdAt});

  factory TransactionHistoryEntity.fromModel(TransactionHistoryModel model) {
    return TransactionHistoryEntity(
      id: model.id,
      financeId: model.financeId,
      walletId: model.walletId,
      item: model.item,
      amount: model.amount,
      transactionType: model.transactionType,
      transactionStatus: model.transactionStatus,
      transactionLineType: model.transactionLineType,
      transactionCode: model.transactionCode,
      bankName: model.bankName,
      bankCode: model.bankCode,
      accountNumber: model.accountNumber,
      accountName: model.accountName,
      accountIdentity: model.accountIdentity,
      accountPhoneNumber: model.accountPhoneNumber,
      createdAt: model.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        financeId,
        walletId,
        item,
        amount,
        transactionType,
        transactionStatus,
        transactionLineType,
        transactionCode,
        bankName,
        bankCode,
        accountNumber,
        accountName,
        accountIdentity,
        accountPhoneNumber,
        createdAt,
      ];
}

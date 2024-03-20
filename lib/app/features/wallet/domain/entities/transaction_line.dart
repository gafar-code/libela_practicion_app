import 'package:equatable/equatable.dart';
import 'package:libela_practition/app/features/wallet/data/models/transaction_line.dart';

class TransactionLineEntity extends Equatable {
  final String? id;
  final String? item;
  final String? walletId;
  final int? amount;
  final String? transactionType;
  final String? transactionStatus;
  final String? transactionLineType;
  final String? createdAt;
  final String? updatedAt;

  TransactionLineEntity(
      {this.id,
      this.item,
      this.walletId,
      this.amount,
      this.transactionType,
      this.transactionStatus,
      this.transactionLineType,
      this.createdAt,
      this.updatedAt});

  factory TransactionLineEntity.fromModel(TransactionLineModel model) {
    return TransactionLineEntity(
      id: model.id,
      item: model.item,
      walletId: model.walletId,
      amount: model.amount,
      transactionType: model.transactionType,
      transactionStatus: model.transactionStatus,
      transactionLineType: model.transactionLineType,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        item,
        walletId,
        amount,
        transactionType,
        transactionStatus,
        transactionLineType,
        createdAt,
        updatedAt
      ];
}

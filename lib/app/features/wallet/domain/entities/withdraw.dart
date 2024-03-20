import 'package:equatable/equatable.dart';

import '../../data/models/withdraw.dart';

class WithdrawEntity extends Equatable {
  final String? id;
  final String? transactionStatus;
  final String? refCode;
  final String? createdAt;

  WithdrawEntity(
      {this.id, this.transactionStatus, this.refCode, this.createdAt});
  factory WithdrawEntity.fromModel(WithdrawModel model) {
    return WithdrawEntity(
        id: model.id,
        transactionStatus: model.transactionStatus,
        refCode: model.refCode,
        createdAt: model.createdAt);
  }

  @override
  List<Object?> get props => [id, transactionStatus, refCode, createdAt];
}

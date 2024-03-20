import 'package:equatable/equatable.dart';

import '../../data/models/withdraw_request.dart';

class WithdrawRequestEntity extends Equatable {
  final String? id;
  final String? transactionStatus;
  final String? refCode;
  final String? createdAt;

  WithdrawRequestEntity(
      {this.id, this.transactionStatus, this.refCode, this.createdAt});
  factory WithdrawRequestEntity.fromModel(WithdrawRequestModel model) {
    return WithdrawRequestEntity(
      id: model.id,
      transactionStatus: model.transactionStatus,
      refCode: model.refCode,
      createdAt: model.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, transactionStatus, refCode, createdAt];
}

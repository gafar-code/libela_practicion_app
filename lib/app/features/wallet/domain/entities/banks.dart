import 'package:equatable/equatable.dart';

import '../../data/models/banks.dart';

class BanksEntity extends Equatable {
  final int? bankId;
  final String? bankName;
  final String? bankAlias;
  final String? bankCode;
  final int? bankOrder;
  final String? bankColor;
  final int? bankStatus;

  BanksEntity(
      {this.bankId,
      this.bankName,
      this.bankAlias,
      this.bankCode,
      this.bankOrder,
      this.bankColor,
      this.bankStatus});

  factory BanksEntity.fromModel(BanksModel model) {
    return BanksEntity(
      bankId: model.bankId,
      bankName: model.bankName,
      bankAlias: model.bankAlias,
      bankCode: model.bankCode,
      bankOrder: model.bankOrder,
      bankColor: model.bankColor,
      bankStatus: model.bankStatus,
    );
  }

  @override
  List<Object?> get props => [
        bankId,
        bankName,
        bankAlias,
        bankCode,
        bankOrder,
        bankColor,
        bankStatus,
      ];
}

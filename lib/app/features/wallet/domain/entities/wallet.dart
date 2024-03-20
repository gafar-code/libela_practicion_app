import 'package:equatable/equatable.dart';

import '../../data/models/wallet.dart';

class WalletEntity extends Equatable {
  final String? id;
  final String? practitionersId;
  final String? currency;
  final String? balance;
  final int? isActive;
  final String? createdAt;
  final String? updatedAt;
  final int? point;

  WalletEntity(
      {this.id,
      this.practitionersId,
      this.currency,
      this.balance,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.point});

  factory WalletEntity.fromModel(WalletModel model) {
    return WalletEntity(
        id: model.id,
        practitionersId: model.practitionersId,
        currency: model.currency,
        balance: model.balance,
        isActive: model.isActive,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        point: model.point);
  }

  @override
  List<Object?> get props => [
        id,
        practitionersId,
        currency,
        balance,
        isActive,
        createdAt,
        updatedAt,
        point
      ];
}

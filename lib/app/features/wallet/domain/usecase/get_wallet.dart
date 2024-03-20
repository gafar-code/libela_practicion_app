import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/core/usecase/usecase.dart';
import 'package:libela_practition/app/features/wallet/domain/entities/wallet.dart';
import 'package:libela_practition/app/features/wallet/domain/repositories/wallet_repositories.dart';

import '../../../../core/error/error_imports.dart';

class GetWallet extends UseCaseWithoutArgument<WalletEntity> {
  final WalletRepositories _walletRepositories;

  GetWallet(this._walletRepositories);

  @override
  Future<Either<RemoteFailure, WalletEntity>> call() async {
    return _walletRepositories.getWallet();
  }
}

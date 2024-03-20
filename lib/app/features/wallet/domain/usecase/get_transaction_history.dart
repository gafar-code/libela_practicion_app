import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/core/usecase/usecase.dart';
import 'package:libela_practition/app/features/wallet/domain/entities/transaction_history.dart';
import 'package:libela_practition/app/features/wallet/domain/repositories/wallet_repositories.dart';
import 'package:libela_practition/app/features/wallet/presentation/utils/models/wallet_limit_params.dart';

import '../../../../core/error/error_imports.dart';

class GetTransactionHistory
    extends UseCase<List<TransactionHistoryEntity>, WalletLimitParams> {
  final WalletRepositories _walletRepositories;

  GetTransactionHistory(this._walletRepositories);

  @override
  Future<Either<RemoteFailure, List<TransactionHistoryEntity>>> call(
      WalletLimitParams param) async {
    return _walletRepositories.getTransactionHistory(param);
  }
}

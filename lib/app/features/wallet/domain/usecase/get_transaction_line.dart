import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/core/usecase/usecase.dart';
import 'package:libela_practition/app/features/wallet/domain/repositories/wallet_repositories.dart';
import 'package:libela_practition/app/features/wallet/presentation/utils/models/wallet_limit_params.dart';

import '../../../../core/error/error_imports.dart';
import '../entities/transaction_line.dart';

class GetTransactionLine
    extends UseCase<List<TransactionLineEntity>, WalletLimitParams> {
  final WalletRepositories _walletRepositories;

  GetTransactionLine(this._walletRepositories);

  @override
  Future<Either<RemoteFailure, List<TransactionLineEntity>>> call(
      WalletLimitParams param) async {
    return _walletRepositories.getTransactionLine(param);
  }
}

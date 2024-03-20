import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/core/error/failure/remote_failure.dart';

import '../../presentation/utils/models/bank_account_body.dart';
import '../../presentation/utils/models/typedef.dart';
import '../../presentation/utils/models/wallet_limit_params.dart';
import '../../presentation/utils/models/withdraw_body.dart';
import '../entities/transaction_history.dart';
import '../entities/transaction_line.dart';
import '../entities/wallet.dart';
import '../entities/withdraw_request.dart';

abstract class WalletRepositories {
  Future<Either<RemoteFailure, WalletEntity>> getWallet();
  Future<Either<RemoteFailure, List<TransactionHistoryEntity>>>
      getTransactionHistory(WalletLimitParams param);
  Future<Either<RemoteFailure, List<TransactionLineEntity>>> getTransactionLine(
      WalletLimitParams param);
  Future<Either<RemoteFailure, WithdrawRequestEntity>> withdrawRequest(
      WithdrawBody body);
  Future<Either<RemoteFailure, Banks>> getListBank();
  Future<Either<RemoteFailure, BankAccounts>> getBankAccount();
  Future<Either<RemoteFailure, bool>> createBankAccount(BankAccountBody body);
}

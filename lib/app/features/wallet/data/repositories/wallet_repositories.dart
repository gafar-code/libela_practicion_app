import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error_imports.dart';
import '../../domain/entities/bank_account.dart';
import '../../domain/entities/banks.dart';
import '../../domain/entities/transaction_history.dart';
import '../../domain/entities/transaction_line.dart';
import '../../domain/entities/wallet.dart';
import '../../domain/entities/withdraw_request.dart';
import '../../domain/repositories/wallet_repositories.dart';
import '../../presentation/utils/models/bank_account_body.dart';
import '../../presentation/utils/models/typedef.dart';
import '../../presentation/utils/models/wallet_limit_params.dart';
import '../../presentation/utils/models/withdraw_body.dart';
import '../data_sources/wallet_remote_data_sources.dart';

class WalletRepositoriesImpl implements WalletRepositories {
  final WalletRemoteDataSource _walletRemoteDataSources;
  WalletRepositoriesImpl(this._walletRemoteDataSources);

  @override
  Future<Either<RemoteFailure, WalletEntity>> getWallet() async {
    try {
      final response = await _walletRemoteDataSources.getWallet();
      return Right(WalletEntity.fromModel(response));
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  Future<Either<RemoteFailure, List<TransactionHistoryEntity>>>
      getTransactionHistory(WalletLimitParams param) async {
    try {
      final response =
          await _walletRemoteDataSources.getTransactionHistory(param);
      return Right(
          response.map((e) => TransactionHistoryEntity.fromModel(e)).toList());
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  Future<Either<RemoteFailure, List<TransactionLineEntity>>> getTransactionLine(
      WalletLimitParams param) async {
    try {
      final response = await _walletRemoteDataSources.getTransactionLine(param);
      return Right(
          response.map((e) => TransactionLineEntity.fromModel(e)).toList());
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  Future<Either<RemoteFailure, WithdrawRequestEntity>> withdrawRequest(
      WithdrawBody body) async {
    try {
      final response = await _walletRemoteDataSources.withdrawRequest(body);
      return Right(WithdrawRequestEntity.fromModel(response));
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, Banks>> getListBank() async {
    try {
      final data = await _walletRemoteDataSources.getListBank();
      final banks = data.map((e) => BanksEntity.fromModel(e)).toList();
      return Right(banks);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, BankAccounts>> getBankAccount() async {
    try {
      final data = await _walletRemoteDataSources.getBankAccount();
      final banks = data.map((e) => BankAccountEntity.fromModel(e)).toList();
      return Right(banks);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, bool>> createBankAccount(
      BankAccountBody body) async {
    try {
      final data = await _walletRemoteDataSources.createBankAccount(body);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }
}

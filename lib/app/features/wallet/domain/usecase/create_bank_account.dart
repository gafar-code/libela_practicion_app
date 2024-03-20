// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/models/bank_account_body.dart';
import '../repositories/wallet_repositories.dart';

class CreateBankAccountWallet extends UseCase<bool, BankAccountBody> {
  final WalletRepositories _walletRepositories;

  CreateBankAccountWallet(this._walletRepositories);

  @override
  Future<Either<RemoteFailure, bool>> call(BankAccountBody param) {
    return _walletRepositories.createBankAccount(param);
  }
}

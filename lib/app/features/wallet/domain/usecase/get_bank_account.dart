import 'package:fpdart/fpdart.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/models/typedef.dart';
import '../repositories/wallet_repositories.dart';

class GetBankAccountsWallet extends UseCaseWithoutArgument<BankAccounts> {
  final WalletRepositories _walletRepositories;

  GetBankAccountsWallet(this._walletRepositories);

  @override
  Future<Either<RemoteFailure, BankAccounts>> call() async {
    return _walletRepositories.getBankAccount();
  }
}

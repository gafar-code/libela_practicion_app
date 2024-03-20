import 'package:fpdart/fpdart.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/models/typedef.dart';
import '../repositories/wallet_repositories.dart';

class GetListBankWallet extends UseCaseWithoutArgument<Banks> {
  final WalletRepositories _walletRepositories;

  GetListBankWallet(this._walletRepositories);

  @override
  Future<Either<RemoteFailure, Banks>> call() async {
    return _walletRepositories.getListBank();
  }
}

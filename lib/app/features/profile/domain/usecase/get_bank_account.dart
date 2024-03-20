import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/repositories/profile_repositories.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/typedef.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetBankAccounts extends UseCaseWithoutArgument<BankAccounts> {
  final ProfileRepositories _profileRepositories;

  GetBankAccounts(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, BankAccounts>> call() async {
    return _profileRepositories.getBankAccount();
  }
}

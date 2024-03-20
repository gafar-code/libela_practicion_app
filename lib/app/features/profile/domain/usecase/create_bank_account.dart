// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/repositories/profile_repositories.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/bank_account_body.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class CreateBankAccount extends UseCase<bool, BankAccountBody> {
  final ProfileRepositories _profileRepositories;

  CreateBankAccount(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, bool>> call(BankAccountBody param) {
    return _profileRepositories.createBankAccount(param);
  }
}

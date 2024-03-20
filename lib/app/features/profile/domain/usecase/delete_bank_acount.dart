// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/repositories/profile_repositories.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/delete_bank_account_body.dart';

class DeleteBankAccount extends UseCase<bool, DeleteBankAccountBody> {
  final ProfileRepositories _profileRepositories;

  DeleteBankAccount(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, bool>> call(DeleteBankAccountBody param) {
    return _profileRepositories.deleteBankAccount(param);
  }
}

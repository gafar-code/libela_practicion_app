// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/repositories/profile_repositories.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/change_phone_verify_body.dart';

class ChangePhoneVerify extends UseCase<String, ChangePhoneVerifyBody> {
  final ProfileRepositories _profileRepositories;

  ChangePhoneVerify(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, String>> call(ChangePhoneVerifyBody param) {
    return _profileRepositories.verifychangePhone(param);
  }
}

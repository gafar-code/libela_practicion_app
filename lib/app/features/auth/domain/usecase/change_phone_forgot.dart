// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/typedef.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/new_phone_body.dart';

class ChangePhoneForgot extends UseCase<IsSuccess, NewPhoneBody> {
  final AuthRepositories _authRepositories;

  ChangePhoneForgot(this._authRepositories);

  @override
  Future<Either<RemoteFailure, IsSuccess>> call(NewPhoneBody param) {
    return _authRepositories.changePhoneForgot(param);
  }
}

// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/typedef.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/forgot_phone_verify_body.dart';

class VerifyForgotPhone extends UseCase<Token, ForgotPhoneVerifyBody> {
  final AuthRepositories _authRepositories;

  VerifyForgotPhone(this._authRepositories);

  @override
  Future<Either<RemoteFailure, Token>> call(ForgotPhoneVerifyBody param) {
    return _authRepositories.verifyForgotPhoneNumber(param);
  }
}

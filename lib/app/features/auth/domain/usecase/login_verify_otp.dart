// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/register_verify_otp.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/otp_body.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class LoginVerifyOtp extends UseCase<AuthEntity, VerifyOTPBody> {
  final AuthRepositories _authRepositories;

  LoginVerifyOtp(this._authRepositories);

  @override
  Future<Either<RemoteFailure, AuthEntity>> call(VerifyOTPBody param) {
    return _authRepositories.verifyOTPlogin(param);
  }
}

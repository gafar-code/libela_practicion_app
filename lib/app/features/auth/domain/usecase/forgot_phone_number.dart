// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/forgot_phone_body.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/typedef.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class ForgotPhoneNumber extends UseCase<OtpToken, ForgotPhoneBody> {
  final AuthRepositories _authRepositories;

  ForgotPhoneNumber(this._authRepositories);

  @override
  Future<Either<RemoteFailure, OtpToken>> call(ForgotPhoneBody param) {
    return _authRepositories.forgotPhoneNumber(param);
  }
}

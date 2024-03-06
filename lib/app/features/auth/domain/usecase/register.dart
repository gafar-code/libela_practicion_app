// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/register_phone.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/register_body.dart';

class RegisterPhone extends UseCase<RegisterPhoneEntity, RegisterBody> {
  final AuthRepositories _authRepositories;

  RegisterPhone(this._authRepositories);

  @override
  Future<Either<RemoteFailure, RegisterPhoneEntity>> call(RegisterBody param) {
    return _authRepositories.registerPhone(param);
  }
}

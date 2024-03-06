// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/login_body.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login_entity.dart';

class Login extends UseCase<LoginEntity, LoginBody> {
  final AuthRepositories _authRepositories;

  Login(this._authRepositories);

  @override
  Future<Either<RemoteFailure, LoginEntity>> call(LoginBody param) {
    return _authRepositories.login(param);
  }
}

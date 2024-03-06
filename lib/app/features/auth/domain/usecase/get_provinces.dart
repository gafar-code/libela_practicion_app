import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/typedef.dart';

class GetProvinces extends UseCaseWithoutArgument<ProvinciesList> {
  final AuthRepositories _authRepositories;

  GetProvinces(this._authRepositories);

  @override
  Future<Either<RemoteFailure, ProvinciesList>> call() async {
    return _authRepositories.getProvinces();
  }
}

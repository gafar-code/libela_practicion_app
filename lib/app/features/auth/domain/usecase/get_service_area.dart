import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/service_area.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetServiceArea extends UseCaseWithoutArgument<List<ServiceAreaEntity>> {
  final AuthRepositories _authRepositories;

  GetServiceArea(this._authRepositories);

  @override
  Future<Either<RemoteFailure, List<ServiceAreaEntity>>> call() async {
    return _authRepositories.getServiceArea();
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/professions.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetProfession extends UseCaseWithoutArgument<List<ProfessionsEntity>> {
  final AuthRepositories _authRepositories;

  GetProfession(this._authRepositories);

  @override
  Future<Either<RemoteFailure, List<ProfessionsEntity>>> call() async {
    return _authRepositories.getProfessions();
  }
}

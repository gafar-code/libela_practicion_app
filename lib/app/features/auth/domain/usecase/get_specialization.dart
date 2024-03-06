// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/specialization.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/typedef.dart';

class GetSpecialization
    extends UseCase<List<SpecializationEntity>, ProfessionId> {
  final AuthRepositories _authRepositories;

  GetSpecialization(this._authRepositories);

  @override
  Future<Either<RemoteFailure, List<SpecializationEntity>>> call(
      ProfessionId param) async {
    return _authRepositories.getSpecializations(param);
  }
}

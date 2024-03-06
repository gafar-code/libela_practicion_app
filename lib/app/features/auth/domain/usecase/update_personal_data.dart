// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/personal_data.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/personal_data_body.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class UpdatePersonalData extends UseCase<PersonalDataEntity, PersonalDataBody> {
  final AuthRepositories _authRepositories;

  UpdatePersonalData(this._authRepositories);

  @override
  Future<Either<RemoteFailure, PersonalDataEntity>> call(
      PersonalDataBody param) {
    return _authRepositories.updatePersonalData(param);
  }
}

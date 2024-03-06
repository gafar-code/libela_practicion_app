// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/personal_data.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/profession_body.dart';

class UpdateProfessionData extends UseCase<PersonalDataEntity, ProfessionBody> {
  final AuthRepositories _authRepositories;

  UpdateProfessionData(this._authRepositories);

  @override
  Future<Either<RemoteFailure, PersonalDataEntity>> call(ProfessionBody param) {
    return _authRepositories.updateProfessionData(param);
  }
}

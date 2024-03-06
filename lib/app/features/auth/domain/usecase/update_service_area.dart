// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/service_area_data.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/personal_service_area_body.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class UpdateServiceAreaData
    extends UseCase<List<ServiceAreaDataEntity>, PersonalServiceAreaBody> {
  final AuthRepositories _authRepositories;

  UpdateServiceAreaData(this._authRepositories);

  @override
  Future<Either<RemoteFailure, List<ServiceAreaDataEntity>>> call(
      PersonalServiceAreaBody param) {
    return _authRepositories.updateServiceAreaData(param);
  }
}

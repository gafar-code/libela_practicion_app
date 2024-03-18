// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/entities/change_phone.dart';
import 'package:libela_practition/app/features/profile/domain/repositories/profile_repositories.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/change_phone_request_body.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class ChangePhoneRequest
    extends UseCase<ChangePhoneEntity, ChangePhoneRequestBody> {
  final ProfileRepositories _profileRepositories;

  ChangePhoneRequest(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, ChangePhoneEntity>> call(
      ChangePhoneRequestBody param) {
    return _profileRepositories.changePhone(param);
  }
}

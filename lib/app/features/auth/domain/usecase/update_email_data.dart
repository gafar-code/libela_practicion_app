// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/personal_data.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/email_body.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class UpdateEmailData extends UseCase<PersonalDataEntity, EmailBody> {
  final AuthRepositories _authRepositories;

  UpdateEmailData(this._authRepositories);

  @override
  Future<Either<RemoteFailure, PersonalDataEntity>> call(EmailBody param) {
    return _authRepositories.updateEmailData(param);
  }
}

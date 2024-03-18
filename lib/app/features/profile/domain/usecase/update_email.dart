// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/repositories/profile_repositories.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/update_email_body.dart';

class UpdateEmail extends UseCase<bool, UpdateEmailBody> {
  final ProfileRepositories _profileRepositories;

  UpdateEmail(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, bool>> call(UpdateEmailBody param) {
    return _profileRepositories.updateEmail(param);
  }
}

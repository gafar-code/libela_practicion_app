import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/entities/update_profile.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/profile_body.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

import '../repositories/profile_repositories.dart';

class UpdateProfile extends UseCase<UpdateProfileEntity, ProfileBody> {
  final ProfileRepositories _profileRepositories;

  UpdateProfile(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, UpdateProfileEntity>> call(
      ProfileBody body) async {
    return _profileRepositories.updateProfile(body);
  }
}

import 'package:fpdart/fpdart.dart';

import 'package:libela_practition/app/features/profile/domain/entities/user_profile.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

import '../repositories/profile_repositories.dart';

class GetUserProfile extends UseCaseWithoutArgument<UserProfileEntity> {
  final ProfileRepositories _profileRepositories;

  GetUserProfile(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, UserProfileEntity>> call() async {
    return _profileRepositories.getUserProfile();
  }
}

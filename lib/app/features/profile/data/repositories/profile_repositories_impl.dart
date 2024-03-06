import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error_imports.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repositories.dart';
import '../data_sources/profile_remote_data_source.dart';

class ProfileRepositoriesImpl implements ProfileRepositories {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  ProfileRepositoriesImpl(this._profileRemoteDataSource);

  @override
  Future<Either<RemoteFailure, UserProfileEntity>> getUserProfile() async {
    try {
      final data = await _profileRemoteDataSource.getUserProfile();
      final userProfile = UserProfileEntity.fromModel(data);
      return Right(userProfile);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }
}

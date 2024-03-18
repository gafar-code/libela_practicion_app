import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/entities/update_profile.dart';

import '../../../../core/error/error_imports.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repositories.dart';
import '../../presentation/utils/model/image_body.dart';
import '../../presentation/utils/model/profile_body.dart';
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

  @override
  Future<Either<RemoteFailure, String>> uploadImage(
      ImageUploadBody body) async {
    try {
      final data = await _profileRemoteDataSource.uploadImages(body);
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, UpdateProfileEntity>> updateProfile(
      ProfileBody body) async {
    try {
      final data = await _profileRemoteDataSource.updateProfile(body);
      final userProfile = UpdateProfileEntity.fromModel(data);
      return Right(userProfile);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/entities/update_profile.dart';
import 'package:libela_practition/app/features/profile/domain/entities/user_profile.dart';

import '../../../../core/error/error_imports.dart';
import '../../presentation/utils/model/image_body.dart';
import '../../presentation/utils/model/profile_body.dart';

abstract class ProfileRepositories {
  Future<Either<RemoteFailure, UserProfileEntity>> getUserProfile();
  Future<Either<RemoteFailure, String>> uploadImage(ImageUploadBody body);
  Future<Either<RemoteFailure, UpdateProfileEntity>> updateProfile(
      ProfileBody body);
}

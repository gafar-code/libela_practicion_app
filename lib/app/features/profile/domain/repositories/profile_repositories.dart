import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/entities/user_profile.dart';

import '../../../../core/error/error_imports.dart';

abstract class ProfileRepositories {
  Future<Either<RemoteFailure, UserProfileEntity>> getUserProfile();
}

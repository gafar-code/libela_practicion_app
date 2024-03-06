// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:libela_practition/app/features/auth/domain/entities/image_upload.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/image_body.dart';

class UploadImage extends UseCase<List<ImageUploadEntity>, ImageUploadBody> {
  final AuthRepositories _repo;

  UploadImage(this._repo);
  @override
  Future<Either<RemoteFailure, List<ImageUploadEntity>>> call(
      ImageUploadBody argument) {
    return _repo.uploadImage(argument);
  }
}

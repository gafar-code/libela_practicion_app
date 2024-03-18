// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/image_body.dart';
import '../repositories/profile_repositories.dart';

class UploadImage extends UseCase<String, ImageUploadBody> {
  final ProfileRepositories _repo;

  UploadImage(this._repo);
  @override
  Future<Either<RemoteFailure, String>> call(ImageUploadBody argument) {
    return _repo.uploadImage(argument);
  }
}

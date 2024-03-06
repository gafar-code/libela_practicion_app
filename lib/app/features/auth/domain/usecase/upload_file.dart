// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/file_body.dart';
import '../entities/file_upload.dart';

class UploadFile extends UseCase<UploadFileEntity, FileUploadBody> {
  final AuthRepositories _repo;

  UploadFile(this._repo);
  @override
  Future<Either<RemoteFailure, UploadFileEntity>> call(
      FileUploadBody argument) {
    return _repo.uploadFile(argument);
  }
}

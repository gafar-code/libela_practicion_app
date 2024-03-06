// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/personal_document_body.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/document_data.dart';

class UpdateDocumentData
    extends UseCase<List<DocumentDataEntity>, PersonalDocumentBody> {
  final AuthRepositories _authRepositories;

  UpdateDocumentData(this._authRepositories);

  @override
  Future<Either<RemoteFailure, List<DocumentDataEntity>>> call(
      PersonalDocumentBody param) {
    return _authRepositories.updateDocumentData(param);
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/repositories/profile_repositories.dart';
import 'package:libela_practition/app/features/profile/presentation/utils/model/typedef.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetListBank extends UseCaseWithoutArgument<Banks> {
  final ProfileRepositories _profileRepositories;

  GetListBank(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, Banks>> call() async {
    return _profileRepositories.getListBank();
  }
}
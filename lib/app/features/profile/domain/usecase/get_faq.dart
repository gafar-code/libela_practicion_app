import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/profile/domain/entities/faq.dart';
import 'package:libela_practition/app/features/profile/domain/repositories/profile_repositories.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetFaq extends UseCaseWithoutArgument<List<FaqEntity>> {
  final ProfileRepositories _profileRepositories;

  GetFaq(this._profileRepositories);

  @override
  Future<Either<RemoteFailure, List<FaqEntity>>> call() async {
    return _profileRepositories.getFaq();
  }
}

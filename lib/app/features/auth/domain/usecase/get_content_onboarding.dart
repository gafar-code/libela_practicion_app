import 'package:libela_practition/app/features/auth/domain/entities/onboarding.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/usecase/usecase.dart';

class GetContentOnboarding
    extends UseCaseWithoutEither<List<OnboardingEntity>> {
  final AuthRepositories _authRepositories;

  GetContentOnboarding(this._authRepositories);

  @override
  Future<List<OnboardingEntity>> call() async {
    return _authRepositories.getContentOnboarding();
  }
}

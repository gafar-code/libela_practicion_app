import 'package:libela_practition/app/features/auth/domain/entities/country.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/usecase/usecase.dart';

class GetCountries extends UseCaseWithoutEither<List<CountryEntity>> {
  final AuthRepositories _authRepositories;

  GetCountries(this._authRepositories);

  @override
  Future<List<CountryEntity>> call({void params}) async {
    return _authRepositories.getCountries();
  }
}

// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/model/typedef.dart';

class GetCities extends UseCase<CitiesList, ProvinceId> {
  final AuthRepositories _authRepositories;

  GetCities(this._authRepositories);

  @override
  Future<Either<RemoteFailure, CitiesList>> call(ProvinceId param) async {
    return _authRepositories.getCities(param);
  }
}

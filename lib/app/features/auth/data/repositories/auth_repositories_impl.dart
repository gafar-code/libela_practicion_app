import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:libela_practition/app/features/auth/domain/entities/cities.dart';
import 'package:libela_practition/app/features/auth/domain/entities/country.dart';
import 'package:libela_practition/app/features/auth/domain/entities/image_upload.dart';
import 'package:libela_practition/app/features/auth/domain/entities/login_entity.dart';
import 'package:libela_practition/app/features/auth/domain/entities/professions.dart';
import 'package:libela_practition/app/features/auth/domain/entities/service_area.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/email_body.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/login_body.dart';

import '../../../../core/error/error_imports.dart';
import '../../domain/entities/document_data.dart';
import '../../domain/entities/file_upload.dart';
import '../../domain/entities/onboarding.dart';
import '../../domain/entities/personal_data.dart';
import '../../domain/entities/provinces.dart';
import '../../domain/entities/register_phone.dart';
import '../../domain/entities/register_verify_otp.dart';
import '../../domain/entities/service_area_data.dart';
import '../../domain/entities/specialization.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../../presentation/utils/model/file_body.dart';
import '../../presentation/utils/model/forgot_phone_body.dart';
import '../../presentation/utils/model/forgot_phone_verify_body.dart';
import '../../presentation/utils/model/image_body.dart';
import '../../presentation/utils/model/new_phone_body.dart';
import '../../presentation/utils/model/otp_body.dart';
import '../../presentation/utils/model/personal_data_body.dart';
import '../../presentation/utils/model/personal_document_body.dart';
import '../../presentation/utils/model/personal_service_area_body.dart';
import '../../presentation/utils/model/profession_body.dart';
import '../../presentation/utils/model/register_body.dart';
import '../../presentation/utils/model/typedef.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepositoriesImpl(this._authRemoteDataSource);

  @override
  Future<Either<RemoteFailure, LoginEntity>> login(LoginBody body) async {
    try {
      final data = await _authRemoteDataSource.login(body);
      final response = LoginEntity.fromModel(data);
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, RegisterPhoneEntity>> registerPhone(
      RegisterBody body) async {
    try {
      final data = await _authRemoteDataSource.registerPhone(body);
      final response = RegisterPhoneEntity.fromModel(data);
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, AuthEntity>> verifyOTP(
      VerifyOTPBody body) async {
    try {
      final data = await _authRemoteDataSource.verifyOTP(body);
      final response = AuthEntity.fromModel(data);
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, AuthEntity>> verifyOTPlogin(
      VerifyOTPBody body) async {
    try {
      final data = await _authRemoteDataSource.verifyOTPlogin(body);
      final response = AuthEntity.fromModel(data);
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, OtpToken>> forgotPhoneNumber(
      ForgotPhoneBody body) async {
    try {
      final data = await _authRemoteDataSource.forgotPhoneNumber(body);
      final response = data;
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, Token>> verifyForgotPhoneNumber(
      ForgotPhoneVerifyBody body) async {
    try {
      final data = await _authRemoteDataSource.verifyForgotPhoneNumber(body);
      final response = data;
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, IsSuccess>> changePhoneForgot(
      NewPhoneBody body) async {
    try {
      final data = await _authRemoteDataSource.changePhoneForgot(body);
      final response = data;
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<List<OnboardingEntity>> getContentOnboarding() async {
    final data = await _authRemoteDataSource.getContentOnboarding();
    return data
        .map(
            (e) => OnboardingEntity(title: e.title, description: e.description))
        .toList();
  }

  @override
  Future<List<CountryEntity>> getCountries() async {
    final data = await _authRemoteDataSource.getCountries();
    return data
        .map((e) => CountryEntity(
              flag: e.flag,
              country: e.country,
              code: e.code,
            ))
        .toList();
  }

  @override
  Future<Either<RemoteFailure, List<ProvincesEntity>>> getProvinces() async {
    try {
      final data = await _authRemoteDataSource.getProvinces();
      final provinces = data.map((e) => ProvincesEntity.fromModel(e)).toList();
      return Right(provinces);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, CitiesList>> getCities(ProvinceId id) async {
    try {
      final data = await _authRemoteDataSource.getCities(id);
      final cities = data.map((e) => CitiesEntity.fromModel(e)).toList();
      return Right(cities);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, List<ProfessionsEntity>>>
      getProfessions() async {
    try {
      final data = await _authRemoteDataSource.getProfessions();
      final profession =
          data.map((e) => ProfessionsEntity.fromModel(e)).toList();
      return Right(profession);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, List<SpecializationEntity>>> getSpecializations(
      ProfessionId id) async {
    try {
      final data = await _authRemoteDataSource.getSpecializations(id);
      final specialization =
          data.map((e) => SpecializationEntity.fromModel(e)).toList();
      return Right(specialization);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, List<ServiceAreaEntity>>>
      getServiceArea() async {
    try {
      final data = await _authRemoteDataSource.getServiceArea();
      final serviceArea =
          data.map((e) => ServiceAreaEntity.fromModel(e)).toList();
      return Right(serviceArea);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, List<ImageUploadEntity>>> uploadImage(
      ImageUploadBody body) async {
    try {
      final data = await _authRemoteDataSource.uploadImages(body);
      final image = data.map((e) => ImageUploadEntity.fromModel(e)).toList();
      return Right(image);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, UploadFileEntity>> uploadFile(
      FileUploadBody body) async {
    try {
      final data = await _authRemoteDataSource.uploadFiles(body);
      final file = UploadFileEntity.fromModel(data);
      return Right(file);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, PersonalDataEntity>> updatePersonalData(
      PersonalDataBody body) async {
    try {
      final data = await _authRemoteDataSource.updatePersonalData(body);
      final personalData = PersonalDataEntity.fromModel(data);
      return Right(personalData);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, PersonalDataEntity>> updateEmailData(
      EmailBody body) async {
    try {
      final data = await _authRemoteDataSource.updateEmailData(body);
      final personalData = PersonalDataEntity.fromModel(data);
      return Right(personalData);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, PersonalDataEntity>> updateProfessionData(
      ProfessionBody body) async {
    try {
      final data = await _authRemoteDataSource.updateProfessionData(body);
      final personalData = PersonalDataEntity.fromModel(data);
      return Right(personalData);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, List<ServiceAreaDataEntity>>>
      updateServiceAreaData(PersonalServiceAreaBody body) async {
    try {
      final data = await _authRemoteDataSource.updateServiceAreaData(body);

      final serviceAreaData =
          data.map((e) => ServiceAreaDataEntity.fromModel(e)).toList();
      return Right(serviceAreaData);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, List<DocumentDataEntity>>> updateDocumentData(
      PersonalDocumentBody body) async {
    try {
      final data = await _authRemoteDataSource.updateDocumentData(body);
      final documentData =
          data.map((e) => DocumentDataEntity.fromModel(e)).toList();
      return Right(documentData);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }
}

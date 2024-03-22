import 'package:fpdart/fpdart.dart';
import 'package:libela_practition/app/features/auth/domain/entities/country.dart';
import 'package:libela_practition/app/features/auth/domain/entities/login_entity.dart';
import 'package:libela_practition/app/features/auth/domain/entities/onboarding.dart';
import 'package:libela_practition/app/features/auth/domain/entities/register_phone.dart';
import 'package:libela_practition/app/features/auth/domain/entities/register_verify_otp.dart';
import 'package:libela_practition/app/features/auth/domain/entities/specialization.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/email_body.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/personal_service_area_body.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/typedef.dart';

import '../../../../core/error/error_imports.dart';
import '../../presentation/utils/model/file_body.dart';
import '../../presentation/utils/model/forgot_phone_body.dart';
import '../../presentation/utils/model/forgot_phone_verify_body.dart';
import '../../presentation/utils/model/login_body.dart';
import '../../presentation/utils/model/new_phone_body.dart';
import '../../presentation/utils/model/otp_body.dart';
import '../../presentation/utils/model/personal_data_body.dart';
import '../../presentation/utils/model/personal_document_body.dart';
import '../../presentation/utils/model/profession_body.dart';
import '../../presentation/utils/model/register_body.dart';
import '../entities/document_data.dart';
import '../entities/file_upload.dart';
import '../entities/personal_data.dart';
import '../entities/professions.dart';
import '../entities/provinces.dart';
import '../entities/service_area.dart';
import '../entities/service_area_data.dart';

abstract class AuthRepositories {
  Future<Either<RemoteFailure, LoginEntity>> login(LoginBody body);
  Future<Either<RemoteFailure, RegisterPhoneEntity>> registerPhone(
      RegisterBody body);
  // Future<Message> sendOTP(SendOTPBody body);
  Future<Either<RemoteFailure, AuthEntity>> verifyOTP(VerifyOTPBody body);
  Future<Either<RemoteFailure, AuthEntity>> verifyOTPlogin(VerifyOTPBody body);

  Future<Either<RemoteFailure, OtpToken>> forgotPhoneNumber(
      ForgotPhoneBody body);
  Future<Either<RemoteFailure, Token>> verifyForgotPhoneNumber(
      ForgotPhoneVerifyBody body);

  Future<Either<RemoteFailure, IsSuccess>> changePhoneForgot(NewPhoneBody body);
  Future<List<OnboardingEntity>> getContentOnboarding();
  Future<List<CountryEntity>> getCountries();
  // Future<List<ProvincesEntity>> getProvinces();
  Future<Either<RemoteFailure, CitiesList>> getCities(ProvinceId id);
  Future<Either<RemoteFailure, List<ProvincesEntity>>> getProvinces();
  Future<Either<RemoteFailure, List<ProfessionsEntity>>> getProfessions();
  Future<Either<RemoteFailure, List<SpecializationEntity>>> getSpecializations(
      ProfessionId id);
  Future<Either<RemoteFailure, List<ServiceAreaEntity>>> getServiceArea();

  Future<Either<RemoteFailure, UploadFileEntity>> uploadFile(
      FileUploadBody body);
  Future<Either<RemoteFailure, PersonalDataEntity>> updatePersonalData(
      PersonalDataBody body);
  Future<Either<RemoteFailure, String>> updateEmailData(EmailBody body);

  Future<Either<RemoteFailure, PersonalDataEntity>> updateProfessionData(
      ProfessionBody body);
  Future<Either<RemoteFailure, List<ServiceAreaDataEntity>>>
      updateServiceAreaData(PersonalServiceAreaBody body);
  Future<Either<RemoteFailure, List<DocumentDataEntity>>> updateDocumentData(
      PersonalDocumentBody body);
}

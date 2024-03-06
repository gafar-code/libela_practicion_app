import 'package:libela_practition/app/features/auth/data/models/cities.dart';
import 'package:libela_practition/app/features/auth/data/models/country.dart';
import 'package:libela_practition/app/features/auth/data/models/onboarding.dart';
import 'package:libela_practition/app/features/auth/data/models/personal_data.dart';
import 'package:libela_practition/app/features/auth/data/models/professions.dart';
import 'package:libela_practition/app/features/auth/data/models/provinces.dart';
import 'package:libela_practition/app/features/auth/data/models/register_phone.dart';
import 'package:libela_practition/app/features/auth/data/models/register_verify_otp.dart';
import 'package:libela_practition/app/features/auth/data/models/service_area.dart';
import 'package:libela_practition/app/features/auth/data/models/specialization.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/email_body.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/personal_data_body.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/profession_body.dart';

import '../../presentation/utils/model/file_body.dart';
import '../../presentation/utils/model/forgot_phone_body.dart';
import '../../presentation/utils/model/forgot_phone_verify_body.dart';
import '../../presentation/utils/model/image_body.dart';
import '../../presentation/utils/model/login_body.dart';
import '../../presentation/utils/model/new_phone_body.dart';
import '../../presentation/utils/model/otp_body.dart';
import '../../presentation/utils/model/personal_document_body.dart';
import '../../presentation/utils/model/personal_service_area_body.dart';
import '../../presentation/utils/model/register_body.dart';
import '../../presentation/utils/model/typedef.dart';
import '../models/document_data.dart';
import '../models/file_upload.dart';
import '../models/image_upload.dart';
import '../models/login_response.dart';
import '../models/service_area_data.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginBody body);

  Future<RegisterPhoneModel> registerPhone(RegisterBody body);

  Future<AuthModel> verifyOTP(VerifyOTPBody body);
  Future<AuthModel> verifyOTPlogin(VerifyOTPBody body);
  Future<OtpToken> forgotPhoneNumber(ForgotPhoneBody body);
  Future<Token> verifyForgotPhoneNumber(ForgotPhoneVerifyBody body);

  Future<IsSuccess> changePhoneForgot(NewPhoneBody body);

  Future<List<OnboardingModel>> getContentOnboarding();
  Future<List<CountryModel>> getCountries();
  Future<List<ProvincesModel>> getProvinces();
  Future<List<CitiesModel>> getCities(ProvinceId id);
  Future<List<ProfessionsModel>> getProfessions();
  Future<List<SpecializationModel>> getSpecializations(ProfessionId id);
  Future<List<ServiceAreaModel>> getServiceArea();
  Future<List<UploadImageModel>> uploadImages(ImageUploadBody body);
  Future<UploadFileModel> uploadFiles(FileUploadBody body);
  Future<PersonalDataModel> updatePersonalData(PersonalDataBody body);
  Future<PersonalDataModel> updateEmailData(EmailBody body);
  Future<PersonalDataModel> updateProfessionData(ProfessionBody body);
  Future<List<ServiceAreaDataModel>> updateServiceAreaData(
      PersonalServiceAreaBody body);
  Future<List<DocumentDataModel>> updateDocumentData(PersonalDocumentBody body);
}

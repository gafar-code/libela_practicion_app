import 'dart:convert';
import 'package:libela_practition/app/core/network/endpoints.dart';
import 'package:libela_practition/app/core/network/request_remote.dart';
import 'package:libela_practition/app/features/auth/data/models/cities.dart';
import 'package:libela_practition/app/features/auth/data/models/country.dart';
import 'package:libela_practition/app/features/auth/data/models/login_response.dart';
import 'package:libela_practition/app/features/auth/data/models/professions.dart';
import 'package:libela_practition/app/features/auth/data/models/register_phone.dart';
import 'package:libela_practition/app/features/auth/data/models/service_area.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/email_body.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/login_body.dart';

import '../../../../core/network/param.dart';
import '../../../../core/network/remote_data_source_impl.dart';
import '../../../../core/network/upload_file_body.dart';
import '../../presentation/utils/model/file_body.dart';
import '../../presentation/utils/model/forgot_phone_body.dart';
import '../../presentation/utils/model/forgot_phone_verify_body.dart';
import '../../presentation/utils/model/new_phone_body.dart';
import '../../presentation/utils/model/otp_body.dart';
import '../../presentation/utils/model/personal_data_body.dart';
import '../../presentation/utils/model/personal_document_body.dart';
import '../../presentation/utils/model/personal_service_area_body.dart';
import '../../presentation/utils/model/profession_body.dart';
import '../../presentation/utils/model/register_body.dart';
import '../../presentation/utils/model/typedef.dart';
import '../models/document_data.dart';
import '../models/file_upload.dart';
import '../models/onboarding.dart';
import '../models/personal_data.dart';
import '../models/provinces.dart';
import '../models/register_verify_otp.dart';
import '../models/service_area_data.dart';
import '../models/specialization.dart';
import 'auth_remote_data_sources.dart';
import 'package:flutter/services.dart';

class AuthRemoteDataSourcesImpl extends RemoteDataSourceImpl
    implements AuthRemoteDataSource {
  AuthRemoteDataSourcesImpl(super.client);

  @override
  Future<LoginResponseModel> login(LoginBody body) async {
    final response = await hitAPI(() => post(Endpoints.login, body));
    return LoginResponseModel.fromJson(response['data']);
  }

  @override
  Future<RegisterPhoneModel> registerPhone(RegisterBody body) async {
    final response = await hitAPI(() => post(Endpoints.registerPhone, body));
    return RegisterPhoneModel.fromJson(response['data']);
  }

  @override
  Future<AuthModel> verifyOTP(VerifyOTPBody body) async {
    final response =
        await hitAPI(() => post(Endpoints.registerVerifyOtp, body));
    return AuthModel.fromJson(response['data']);
  }

  @override
  Future<AuthModel> verifyOTPlogin(VerifyOTPBody body) async {
    final response = await hitAPI(() => post(Endpoints.loginVerifyOtp, body));
    return AuthModel.fromJson(response['data']);
  }

  @override
  Future<OtpToken> forgotPhoneNumber(ForgotPhoneBody body) async {
    final response =
        await hitAPI(() => post(Endpoints.forgotPhoneRequest, body));
    return response['data']['otpToken'];
  }

  @override
  Future<Token> verifyForgotPhoneNumber(ForgotPhoneVerifyBody body) async {
    final response =
        await hitAPI(() => post(Endpoints.verifyForgotPhone, body));
    return response['data']['token'];
  }

  @override
  Future<IsSuccess> changePhoneForgot(NewPhoneBody body) async {
    final response = await hitAPI(() => post(Endpoints.changePhone, body));
    return response['code'] == 200;
  }

  @override
  Future<List<OnboardingModel>> getContentOnboarding() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/onboarding.json');
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => OnboardingModel.fromJson(e)).toList();
    } catch (e) {
      throw "Error: $e";
    }
  }

  @override
  Future<List<CountryModel>> getCountries() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/country.json');
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((e) => CountryModel.fromJson(e)).toList();
    } catch (e) {
      throw "Error: $e";
    }
  }

  @override
  Future<List<ProvincesModel>> getProvinces() async {
    final response = await hitAPI(() => get(Endpoints.provinces));
    return List.from(response['data'])
        .map((e) => ProvincesModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<CitiesModel>> getCities(ProvinceId id) async {
    final param = ProvinciesIdParam(id);
    final response = await hitAPI(() => get(Endpoints.cities, param));
    return List.from(response['data'])
        .map((e) => CitiesModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<ProfessionsModel>> getProfessions() async {
    final response = await hitAPI(() => get(
          Endpoints.professions,
        ));
    return List.from(response['data'])
        .map((e) => ProfessionsModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<SpecializationModel>> getSpecializations(ProfessionId id) async {
    final param = ProfessionIdParam(id);
    final response = await hitAPI(() => get(Endpoints.specialization, param));
    return List.from(response['data'])
        .map((e) => SpecializationModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<ServiceAreaModel>> getServiceArea() async {
    final response = await hitAPI(() => get(Endpoints.serviceArea));
    return List.from(response['data'])
        .map((e) => ServiceAreaModel.fromJson(e))
        .toList();
  }

  @override
  Future<UploadFileModel> uploadFiles(FileUploadBody data) async {
    var body =
        UploadFileBody(data.fileName ?? '', data.type ?? '', data.file ?? '');
    final response = await hitAPI(() => uploadFile(Endpoints.uploadFile, body));
    return UploadFileModel.fromJson(response['data']);
  }

  @override
  Future<PersonalDataModel> updatePersonalData(PersonalDataBody body) async {
    final response =
        await hitAPI(() => put(Endpoints.personalData, body: body));
    return PersonalDataModel.fromJson(response['data']);
  }

  @override
  Future<String> updateEmailData(EmailBody body) async {
    final response =
        await hitAPI(() => put(Endpoints.personalEmail, body: body));
    return response['data']['email'];
  }

  @override
  Future<PersonalDataModel> updateProfessionData(ProfessionBody body) async {
    final response = await hitAPI(() => put(Endpoints.profession, body: body));
    return PersonalDataModel.fromJson(response['data']);
  }

  @override
  Future<List<ServiceAreaDataModel>> updateServiceAreaData(
      PersonalServiceAreaBody body) async {
    final response =
        await hitAPI(() => put(Endpoints.personalServiceArea, body: body));
    return List.from(response['data'])
        .map((e) => ServiceAreaDataModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<DocumentDataModel>> updateDocumentData(
      PersonalDocumentBody body) async {
    final response =
        await hitAPI(() => put(Endpoints.personalDocument, body: body));
    return List.from(response['data'])
        .map((e) => DocumentDataModel.fromJson(e))
        .toList();
  }
}

class ProvinciesIdParam extends QueryParam {
  final int id;

  ProvinciesIdParam(this.id);

  @override
  Map<String, dynamic> toJson() => {'provinceId': id};
}

class ProfessionIdParam extends QueryParam {
  final String id;

  ProfessionIdParam(this.id);

  @override
  Map<String, dynamic> toJson() => {'professionId': id};
}

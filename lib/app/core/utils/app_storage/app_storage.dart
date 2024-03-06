import 'dart:convert';

import 'package:libela_practition/app/features/auth/domain/entities/register_phone.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/auth/data/models/auth_token.dart';
import '../../../features/auth/data/models/register_phone.dart';
import '../../../features/auth/data/models/register_verify_otp.dart';
import '../../../features/auth/domain/entities/register_verify_otp.dart';

class AppStorage {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final String _onboarding = 'onboarding';
  final String _registerPhone = 'register_phone';
  final String _authData = 'auth_data';
  final String _authToken = 'auth_token';
  final String _professionId = 'profession_id';

  //<---------------------------(Start Onboarding)--------------------------->//
  Future<void> onboardingSkip() async {
    await _prefs?.setBool(_onboarding, true);
  }

  bool? onboardingCheck() {
    return _prefs?.getBool(_onboarding);
  }
  //<---------------------------(End Onboarding)--------------------------->//

  //<---------------------------(Start Auth Data)--------------------------->//
  Future<void> saveAuthData({AuthEntity? data}) async {
    String authData = json.encode(data?.toJson());
    final token =
        AuthToken(token: data?.token, refreshToken: data?.refreshToken);
    await saveAuthToken(token);
    await _prefs?.setString(_authData, authData);
  }

  Future<AuthEntity?> getAuthData() async {
    final data = _prefs?.getString(_authData);
    if (data != null) {
      final dataModel = AuthModel.fromJson(json.decode(data));
      return AuthEntity.fromModel(dataModel);
    }
    return null;
  }
  //<---------------------------(End Auth Data)--------------------------->//

  //<---------------------------(Start Auth Token)--------------------------->//
  Future<void> saveAuthToken(AuthToken token) async {
    String authToken = json.encode(token.toJson());

    await _prefs?.setString(_authToken, authToken);
  }

  AuthToken? getAuthToken() {
    final data = _prefs?.getString(_authToken);
    if (data != null) {
      final jsonData = json.decode(data);
      final authToken = AuthToken.fromJson(jsonData);
      return authToken;
    }
    return null;
  }

  Future<void> updateAuthToken({String? token, String? refreshToken}) async {
    final authToken = AuthToken(token: token, refreshToken: refreshToken);
    String authTokenData = json.encode(authToken.toJson());
    await _prefs?.setString(_authToken, authTokenData);
  }
  //<---------------------------(End Auth Token)--------------------------->//

//<---------------------------(Start Register)--------------------------->//
  Future<void> saveRegisterPhoneData({RegisterPhoneEntity? data}) async {
    String registerPhoneData = json.encode(data?.toJson());
    await _prefs?.setString(_registerPhone, registerPhoneData);
  }

  Future<RegisterPhoneEntity?> getRegisterPhoneData() async {
    final data = _prefs?.getString(_registerPhone);
    if (data != null) {
      final jsonData = json.decode(data);
      final registerPhoneModel = RegisterPhoneModel.fromJson(jsonData);
      final registerPhone = RegisterPhoneEntity.fromModel(registerPhoneModel);
      return registerPhone;
    }
    return null;
  }

  Future<void> saveProfessionId(String id) async {
    await _prefs?.setString(_professionId, id);
  }

  Future<String?> getProfessionId() async {
    return _prefs?.getString(_professionId);
  }
//<---------------------------(End Register)--------------------------->//

//<---------------------------(Start Clear Data)--------------------------->//
  Future<void> clearRegisterPhoneData() async {
    await _prefs?.remove(_registerPhone);
  }

  Future<void> clearAuthData() async {
    await _prefs?.remove(_authData);
  }

  Future<void> clearProfessionId() async {
    await _prefs?.remove(_professionId);
  }
//<---------------------------(End Clear Data)--------------------------->//
}

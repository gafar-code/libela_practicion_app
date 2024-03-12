import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/features/auth/domain/entities/country.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/get_countries.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/login_body.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../domain/usecase/login.dart';

class LoginController extends GetxController {
  final GetCountries _getCountries;
  final Login _login;
  LoginController(this._getCountries, this._login);

  TextEditingController numberController = TextEditingController();

  List<CountryEntity> countries = [];
  CountryEntity? selectedCountry;

  var isPhoneValidated = false.obs;
  var loginLoading = false.obs;

  void selectCountry(CountryEntity value) {
    selectedCountry = value;
    update();
  }

  Future<void> getCountries() async {
    countries = await _getCountries();
    selectedCountry = countries.where((e) => e.code == 'id').first;
    update();
  }

  List<TextInputFormatter> formaterNumber() => [
        LengthLimitingTextInputFormatter(12),
        FilteringTextInputFormatter.deny(RegExp(r'[^\d+]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text.startsWith('')) {
            return newValue;
          }
          return oldValue;
        }),
      ];

  listenPhoneForm(String value) {
    if (value.startsWith('0') && value.length > (1)) {
      numberController.text = value.substring(1);
      numberController.selection = TextSelection.fromPosition(
          TextPosition(offset: numberController.text.length));
      update();
    }
    if (value.length >= 9) {
      isPhoneValidated(true);
    } else {
      isPhoneValidated(false);
    }
  }

  Future<void> sendOtp() async {
    Get.back();
    loginLoading(true);
    final tokenFcm = await FirebaseMessaging.instance.getToken();
    var body = LoginBody('62${numberController.text}', "whatsapp", tokenFcm);
    final response = await _login(body);
    response.fold((error) {
      print(error.message);
    }, (data) {
      Get.offAllNamed(Routes.LOGIN_OTP, arguments: [body, data]);
    });
    loginLoading(false);
  }

  @override
  void onInit() async {
    numberController.selection = TextSelection.fromPosition(
        TextPosition(offset: numberController.text.length));
    super.onInit();
  }
}

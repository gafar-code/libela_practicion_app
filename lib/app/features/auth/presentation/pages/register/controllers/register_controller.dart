// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/app_storage/app_storage.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register/views/widget/choice_verification.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/register_body.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

import '../../../../domain/entities/country.dart';
import '../../../../domain/entities/register_phone.dart';
import '../../../../domain/usecase/get_countries.dart';
import '../../../../domain/usecase/register.dart';

class RegisterController extends GetxController {
  final GetCountries _getCountries;
  final RegisterPhone _register;

  RegisterController(this._getCountries, this._register);

  TextEditingController numberController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  final storage = AppStorage();

  CountryEntity? selectedCountry;
  int? selectedVerification;
  List<CountryEntity> countries = [];
  var isPhoneValidated = false.obs;
  var registerLoading = false.obs;

  List<dynamic> verificationMethode = [
    {"title": "Kirim melalui WhatsApp", "icon": whatsapp, 'prefix': 'whatsapp'},
    {"title": "Kirim melalui SMS", "icon": message, 'prefix': 'sms'},
  ];

  void selectCountry(CountryEntity value) {
    selectedCountry = value;
    update();
  }

  void selectVerification(int value) {
    selectedVerification = value;
    update();
  }

  Future<void> getCountries() async {
    countries = await _getCountries();
    selectedCountry = countries.where((e) => e.code == 'id').first;
    update();
  }

  void openChoiceVerification() {
    CustomBottomSheet.show(child: const ChoiceVerification());
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
    registerLoading(true);
    var body = RegisterBody(
      phoneNumber: '62${numberController.text}',
      via: "${verificationMethode[selectedVerification ?? 0]['prefix']}"
          .toLowerCase(),
      referralCode: referralCodeController.text,
    );
    final response = await _register(body);
    response.fold((error) {
      print(error.message);
    }, (data) {
      final newRegisterPhoneData = RegisterPhoneEntity(
          otpCode: data.otpCode,
          phoneNumber: '62${numberController.text}',
          otpToken: data.otpToken,
          expiryAt: data.expiryAt);
      storage.saveRegisterPhoneData(data: newRegisterPhoneData);
      Get.offAllNamed(Routes.REGISTER_OTP, arguments: [body]);
    });
    registerLoading(false);
  }

  @override
  void onInit() async {
    numberController.selection = TextSelection.fromPosition(
        TextPosition(offset: numberController.text.length));
    // getCountries();
    super.onInit();
  }
}

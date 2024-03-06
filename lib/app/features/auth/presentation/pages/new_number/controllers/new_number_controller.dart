import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

import '../../../../domain/entities/country.dart';
import '../../../../domain/usecase/change_phone_forgot.dart';
import '../../../../domain/usecase/get_countries.dart';
import '../../../utils/model/new_phone_body.dart';

class NewNumberController extends GetxController {
  final GetCountries _getCountries;
  final ChangePhoneForgot _changePhoneForgot;
  NewNumberController(this._getCountries, this._changePhoneForgot);

  TextEditingController numberController = TextEditingController();

  List<CountryEntity> countries = [];
  CountryEntity? selectedCountry;
  var isPhoneValidated = false.obs;
  var resetPhoneNumberLoading = false.obs;

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

  Future<void> changePhoneNumber() async {
    resetPhoneNumberLoading(true);
    var body = NewPhoneBody(phoneNumber: "62${numberController.text}");
    final result = await _changePhoneForgot(body);
    result.fold((l) {}, (r) {
      Get.offAllNamed(Routes.FORGOT_SUCCESS);
    });
    resetPhoneNumberLoading(false);
  }

  @override
  void onInit() async {
    numberController.selection = TextSelection.fromPosition(
        TextPosition(offset: numberController.text.length));
    super.onInit();
  }
}

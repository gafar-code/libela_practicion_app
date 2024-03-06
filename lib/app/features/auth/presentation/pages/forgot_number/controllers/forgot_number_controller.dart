import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/forgot_phone_number.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/forgot_phone_body.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

class ForgotNumberController extends GetxController {
  final ForgotPhoneNumber _forgotPhoneNumber;
  ForgotNumberController(this._forgotPhoneNumber);
  TextEditingController emailController = TextEditingController();
  var isEmailValidated = false.obs;
  var sendOtpLoading = false.obs;

  void listenEmailForm(String value) {
    if (value.isNotEmpty) {
      if (validateEmail(value)) {
        isEmailValidated(true);
      } else {
        isEmailValidated(false);
      }
    } else {
      isEmailValidated(false);
    }
  }

  bool validateEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  Future<void> sendOtpForgot() async {
    sendOtpLoading(true);
    var body = ForgotPhoneBody(email: emailController.text);
    final result = await _forgotPhoneNumber(body);
    result.fold((l) => Get.snackbar('Error', l.message), (otpToken) {
      Get.offNamed(Routes.FORGOT_OTP,
          arguments: [emailController.text, otpToken]);
    });
    sendOtpLoading(false);
  }
}

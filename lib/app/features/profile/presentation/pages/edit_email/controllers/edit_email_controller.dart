import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/features/profile/domain/usecase/update_email.dart';

import '../../../../../../core/components/snackbar/app_snackbar.dart';
import '../../../utils/model/update_email_body.dart';

class EditEmailController extends GetxController {
  final UpdateEmail updateEmail;
  EditEmailController(this.updateEmail);
  PageController pageController = PageController();
  TextEditingController emailController = TextEditingController();
  var isEmailValidated = false.obs;

  var isLoading = false.obs;

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

  Future<void> toConfirmEmail() async {
    isLoading(true);
    var body = UpdateEmailBody(email: emailController.text);
    final result = await updateEmail(body);
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      AppSnackbar.show(
          message: 'Silahkan verifikasi email anda', type: SnackType.success);
      pageController.nextPage(
          duration: 10.milliseconds, curve: Curves.slowMiddle);
      update();
    });
    isLoading(false);
  }
}

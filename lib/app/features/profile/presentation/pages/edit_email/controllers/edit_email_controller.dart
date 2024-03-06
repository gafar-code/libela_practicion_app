import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEmailController extends GetxController {
  PageController pageController = PageController();
  TextEditingController emailController = TextEditingController();
  var isEmailValidated = false.obs;

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

  void toConfirmEmail() {
    pageController.nextPage(
        duration: 10.milliseconds, curve: Curves.slowMiddle);
    update();
  }
}

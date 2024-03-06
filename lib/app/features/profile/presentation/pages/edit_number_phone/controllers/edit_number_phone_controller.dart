import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EditNumberPhoneController extends GetxController {
  PageController pageController = PageController();
  TextEditingController numberController = TextEditingController();

  late List<TextEditingController> otpControllers;
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  var enableButton = false;

  var isPhoneValidated = false.obs;
  var isLoadingPage = false.obs;

  var countdownSendOtp = ''.obs;
  var isCountdownSendOtpRun = false.obs;

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

  void listenForm(int index, String value) {
    if (value.isNotEmpty) {
      if (index < otpControllers.length - 1) {
        focusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  void startCountdown() {
    int secondsRemaining = 120;
    // ignore: unused_local_variable
    late Timer timer;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        isCountdownSendOtpRun(true);
        int minutes = secondsRemaining ~/ 60;
        int remainingSeconds = secondsRemaining % 60;
        String minutesString = (minutes < 10) ? '0$minutes' : '$minutes';
        String secondsString = (remainingSeconds < 10)
            ? '0$remainingSeconds'
            : '$remainingSeconds';
        countdownSendOtp.value = '$minutesString:$secondsString';
        secondsRemaining--;
      } else {
        countdownSendOtp.value = '00:00';
        isCountdownSendOtpRun(false);
        timer.cancel();
      }
    });
  }

  // Page Transition

  void toVerifyOtp() async {
    // isLoadingPage(true);
    pageController.nextPage(
        duration: 10.milliseconds, curve: Curves.slowMiddle);
    update();
    // await Future.delayed(100.milliseconds, () {
    //   isLoadingPage(false);
    // });
  }

  void backToEmailForm() async {
    // isLoadingPage(true);
    pageController.previousPage(
        duration: 10.milliseconds, curve: Curves.slowMiddle);
    update();
    // await Future.delayed(100.milliseconds, () {
    //   isLoadingPage(false);
    // });
  }

  @override
  void onInit() {
    numberController.selection = TextSelection.fromPosition(
        TextPosition(offset: numberController.text.length));
    otpControllers = List.generate(4, (index) {
      var controller = TextEditingController();
      controller.addListener(_checkIfAllFieldsFilled);
      return controller;
    });
    _checkIfAllFieldsFilled();
    super.onInit();
  }

  void _checkIfAllFieldsFilled() {
    bool allFilled = otpControllers.every((element) => element.text.isNotEmpty);
    enableButton = allFilled;
    update();
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.onClose();
  }
}

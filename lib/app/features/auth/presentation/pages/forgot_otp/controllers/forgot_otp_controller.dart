import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/features/auth/domain/usecase/verify_forgot_phone.dart';

import '../../../../../../core/utils/app_storage/app_storage.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../domain/usecase/forgot_phone_number.dart';
import '../../../utils/model/forgot_phone_body.dart';
import '../../../utils/model/forgot_phone_verify_body.dart';

class ForgotOtpController extends GetxController {
  final VerifyForgotPhone _verifyForgotPhone;
  final ForgotPhoneNumber _forgotPhoneNumber;

  ForgotOtpController(this._verifyForgotPhone, this._forgotPhoneNumber);
  final storage = AppStorage();

  late List<TextEditingController> otpControllers;
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  var enableButton = false;
  bool isLoading = false;
  String? otpToken;
  // var actionStatus = ActionStatus.initalize;

  String email = "";
  var countdownSendOtp = ''.obs;
  var isCountdownSendOtpRun = false.obs;

  Future<void> verifyOtp() async {
    isLoading = true;
    update();
    List<String> otpNumber = [];
    for (var otp in otpControllers) {
      otpNumber.add(otp.text);
    }
    var body = ForgotPhoneVerifyBody(
        email: Get.arguments[0],
        otp: otpNumber.join(),
        otpToken: otpToken ?? '');
    final response = await _verifyForgotPhone(body);
    response.fold((error) {}, (data) {
      Get.offAllNamed(Routes.NEW_NUMBER);
    });
    isLoading = false;
    update();
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

  Future<void> sendOtp() async {
    // isLoading = false;
    // update();
    var body = ForgotPhoneBody(email: Get.arguments[0]);
    final result = await _forgotPhoneNumber(body);
    result.fold((l) => Get.snackbar('Error', l.message), (tokenOtp) {
      startCountdown();
      otpToken = tokenOtp;
    });
    //   isLoading = false;
    // update();
  }

  @override
  void onInit() {
    startCountdown();
    otpToken = Get.arguments[1];
    super.onInit();
    otpControllers = List.generate(4, (index) {
      var controller = TextEditingController();
      controller.addListener(_checkIfAllFieldsFilled);
      return controller;
    });
    _checkIfAllFieldsFilled();
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

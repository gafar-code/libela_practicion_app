import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/features/auth/domain/entities/login_entity.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/login_body.dart';

import '../../../../../../core/utils/app_storage/app_storage.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../domain/usecase/login.dart';
import '../../../../domain/usecase/login_verify_otp.dart';
import '../../../utils/model/otp_body.dart';

class LoginOtpController extends GetxController {
  final LoginVerifyOtp _loginVerifyOtp;
  final Login _login;

  LoginOtpController(this._loginVerifyOtp, this._login);
  final storage = AppStorage();

  late List<TextEditingController> otpControllers;
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  var enableButton = false;
  bool isLoading = false;
  LoginBody? loginBody;
  LoginEntity? loginEntity;
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
    var body = VerifyOTPBody(
        phoneNumber: loginBody?.phoneNumber ?? '',
        otp: otpNumber.join(),
        otpToken: loginEntity?.otpToken ?? '');

    final response = await _loginVerifyOtp(body);
    response.fold((error) {}, (data) {
      storage.saveAuthData(data: data);
      Get.offAllNamed(Routes.MAIN_PAGES);
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
    final response = await _login(loginBody!);
    response.fold((error) {
      print(error.message);
    }, (data) {
      final newResponse = LoginEntity(
          otpCode: data.otpCode,
          otpToken: data.otpToken,
          expiryAt: data.expiryAt);
      loginEntity = newResponse;
      startCountdown();
    });
  }

  @override
  void onInit() {
    loginBody = Get.arguments[0];
    loginEntity = Get.arguments[1];
    startCountdown();
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

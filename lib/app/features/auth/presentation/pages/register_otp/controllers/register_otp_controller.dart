import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/core/utils/app_storage/app_storage.dart';
import 'package:libela_practition/app/features/auth/presentation/utils/model/otp_body.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../domain/entities/register_phone.dart';
import '../../../../domain/usecase/register.dart';
import '../../../../domain/usecase/register_verify_otp.dart';
import '../../../utils/model/register_body.dart';

class RegisterOtpController extends GetxController {
  final RegisterVerifyOtp _registerVerifyOtp;
  final RegisterPhone _register;

  RegisterOtpController(this._registerVerifyOtp, this._register);
  final storage = AppStorage();

  late List<TextEditingController> otpControllers;
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  var enableButton = false;
  bool isLoading = false;
  RegisterBody? registerBody;
  String email = "";
  var countdownSendOtp = ''.obs;
  var isCountdownSendOtpRun = false.obs;

  Future<void> verifyOtp() async {
    isLoading = true;
    update();
    var dataSaved = await storage.getRegisterPhoneData();
    List<String> otpNumber = [];
    for (var otp in otpControllers) {
      otpNumber.add(otp.text);
    }
    var body = VerifyOTPBody(
        phoneNumber: dataSaved?.phoneNumber ?? '',
        otp: otpNumber.join(),
        otpToken: dataSaved?.otpToken ?? '');

    final response = await _registerVerifyOtp(body);
    response.fold((error) {}, (data) {
      storage.saveAuthData(data: data);
      Get.offAllNamed(Routes.REGISTER_FORM, arguments: [0]);
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
    final response = await _register(registerBody!);
    response.fold((error) {
      print(error.message);
    }, (data) {
      final newRegisterPhoneData = RegisterPhoneEntity(
          otpCode: data.otpCode,
          phoneNumber: '${registerBody?.phoneNumber}',
          otpToken: data.otpToken,
          expiryAt: data.expiryAt);
      storage.saveRegisterPhoneData(data: newRegisterPhoneData);
      startCountdown();
    });
  }

  @override
  void onInit() {
    registerBody = Get.arguments[0];
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

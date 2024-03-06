import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFormController extends GetxController {
  late PageController pageController;
  int currentIndex = 0;

  List<String> tabForm = [
    'Data Diri',
    'Email',
    'Profesi',
    'Area Layanan',
    'Dokumen'
  ];

  var selectedPaymentMethode = "".obs;

  void changePage(int index) {
    currentIndex = index;
    update();
  }

  void next() {
    if (currentIndex != 4) {
      currentIndex++;
      update();
    } else {}
  }

  void previous() {
    currentIndex--;
    update();
  }

  Future<void> checkReferralCode() async {}

  void toNextPayment() {}

  void payAndRegister() async {}

  checkArgument() {
    if (Get.arguments[0] != null) {
      currentIndex = Get.arguments[0];
    }
  }

  @override
  void onInit() {
    checkArgument();
    pageController = PageController(initialPage: currentIndex);
    super.onInit();
  }
}

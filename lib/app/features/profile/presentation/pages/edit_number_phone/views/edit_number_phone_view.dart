// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/edit_number_phone/views/section/verification_otp.dart';

import '../controllers/edit_number_phone_controller.dart';
import 'section/phone_form.dart';

class EditNumberPhoneView extends GetView<EditNumberPhoneController> {
  const EditNumberPhoneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.pageController.page == 1) {
          controller.backToPhoneForm();
          return false;
        } else {
          return true;
        }
      },
      child: PageView.builder(
          itemCount: 2,
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            if (index == 0) {
              return const PhoneForm();
            } else {
              return const VerificationOtp();
            }
          }),
    );
  }
}

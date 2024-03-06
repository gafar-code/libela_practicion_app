// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/edit_email/views/section/verification_email.dart';

import '../controllers/edit_email_controller.dart';
import 'section/email_form.dart';

class EditEmailView extends GetView<EditEmailController> {
  const EditEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 2,
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          if (index == 0) {
            return const EmailForm();
          } else {
            return const VerificationEmail();
          }
        });
  }
}

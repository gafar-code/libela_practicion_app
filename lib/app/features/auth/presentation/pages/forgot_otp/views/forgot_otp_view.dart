import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../../config/theme/colors.dart';
import '../controllers/forgot_otp_controller.dart';
import 'section/form.dart';
import 'section/header.dart';

class ForgotOtpView extends GetView<ForgotOtpController> {
  const ForgotOtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
          children: [HeaderSection(), FormSection()],
        ));
  }
}

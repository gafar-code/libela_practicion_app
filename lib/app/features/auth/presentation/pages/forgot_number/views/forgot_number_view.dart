import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_number_controller.dart';
import 'section/form_section.dart';
import 'section/header.dart';

class ForgotNumberView extends GetView<ForgotNumberController> {
  const ForgotNumberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [const HeaderSection(), FormSection(controller: controller)],
    ));
  }
}

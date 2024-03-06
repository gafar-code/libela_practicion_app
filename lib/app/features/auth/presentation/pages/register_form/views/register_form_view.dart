import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register_form/views/section/app_bar.dart';

import '../controllers/register_form_controller.dart';
import 'section/form_step.dart';
import 'section/step.dart';

class RegisterFormView extends GetView<RegisterFormController> {
  const RegisterFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: appBarRegister,
      body: SafeArea(
        child: SizedBox(
          height: getHeightScale(1) - kToolbarHeight,
          width: getWidthScale(1),
          child: const Stack(
            clipBehavior: Clip.none,
            children: [
              StepSection(),
              FormStepSection(),
            ],
          ),
        ),
      ),
    );
  }
}

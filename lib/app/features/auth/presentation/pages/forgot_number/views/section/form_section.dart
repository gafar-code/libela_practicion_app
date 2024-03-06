import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/forgot_number/controllers/forgot_number_controller.dart';

import '../../../../../../../core/components/components_lib.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key, required this.controller});

  final ForgotNumberController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: theme.style.padding.allLarge,
      child: Column(
        children: [
          AppForm(
            type: AppFormType.withLabel,
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            label: 'Email',
            hintText: 'Isi email disini',
            onChanged: (value) => controller.listenEmailForm(value),
          ),
          Gap(36.h),
          Obx(() {
            return PrimaryButton(
              isLoading: controller.sendOtpLoading.value,
              isExpanded: true,
              text: 'Kirim Instruksi',
              onPressed: controller.isEmailValidated.value
                  ? () => controller.sendOtpForgot()
                  : null,
            );
          })
        ],
      ),
    );
  }
}

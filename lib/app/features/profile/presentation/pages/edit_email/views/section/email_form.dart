import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/edit_email/controllers/edit_email_controller.dart';

import 'app_bar.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditEmailController>(builder: (controller) {
      return Scaffold(
        appBar: const AppBarEditEmail(
          title: 'Masukan Alamat Email Baru',
        ),
        body: ListView(padding: theme.style.padding.allLarge, children: [
          AppForm(
            type: AppFormType.withLabel,
            controller: controller.emailController,
            label: 'Email',
            hintText: 'Masukan Alamat Email Baru',
            onChanged: (value) => controller.listenEmailForm(value),
          ),
          Gap(32.h),
          Obx(() => PrimaryButton(
                isLoading: controller.isLoading.value,
                text: 'Kirim Instruksi',
                onPressed: controller.isEmailValidated.value
                    ? () => controller.toConfirmEmail()
                    : null,
              ))
        ]),
      );
    });
  }
}

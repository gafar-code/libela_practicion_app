import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../../../core/components/components_lib.dart';
import '../../controllers/biodata_controller.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterBiodataController>(builder: (controller) {
      return ListView(
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
            return MixButton(
              isLoading: controller.uploadEmailDataLoading,
              textLeft: 'Kembali',
              textRight: 'Selanjutnya',
              onPressedLeft: () => controller.previous(),
              onPressedRight: controller.isEmailValidated.value
                  ? () => controller.uploadEmailData()
                  : null,
            );
          })
        ],
      );
    });
  }
}

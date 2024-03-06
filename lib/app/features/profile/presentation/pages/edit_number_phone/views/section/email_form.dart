import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/edit_number_phone/controllers/edit_number_phone_controller.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/edit_number_phone/views/section/app_bar.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../../../../../../core/utils/assets/local_assets.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNumberPhoneController>(builder: (controller) {
      return Scaffold(
        appBar: const AppBarEditNumberPhone(title: 'Masukkan Nomor Hp'),
        body: ListView(
          padding: theme.style.padding.allLarge,
          children: [
            Row(
              children: [
                Container(
                  height: 44.h,
                  width: 54.w,
                  padding: theme.style.padding.allMedium,
                  decoration: BoxDecoration(
                      borderRadius: theme.style.borderRadius.allSmall,
                      border: theme.style.boder,
                      color: kWhiteColor),
                  child: LocalAssets.image(indo, height: 22.h),
                ),
                Gap(12.w),
                Expanded(
                    child: AppFormNumber(
                  controller: controller.numberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: controller.formaterNumber(),
                  onChanged: (value) => controller.listenPhoneForm(value),
                )),
              ],
            ),
            Gap(36.h),
            Obx(() {
              return PrimaryButton(
                isLoading: false,
                isExpanded: true,
                text: 'Lanjutkan',
                onPressed: controller.isPhoneValidated.value
                    ? () => controller.toVerifyOtp()
                    : null,
              );
            }),
          ],
        ),
      );
    });
  }
}

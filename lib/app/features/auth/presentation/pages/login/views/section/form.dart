import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/login/controllers/login_controller.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

import '../../../../../../../core/utils/assets/assets.dart';
import '../../../../../../../core/utils/assets/local_assets.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Padding(
        padding: theme.style.padding.allLarge,
        child: Column(
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
                  hintText: 'Masukkan Nomor HP',
                  keyboardType: TextInputType.phone,
                  onChanged: controller.listenPhoneForm,
                  inputFormatters: controller.formaterNumber(),
                )),
              ],
            ),
            Gap(16.h),
            Align(
                alignment: Alignment.centerRight,
                child: AppTextButton(
                  text: 'Lupa Nomor HP?',
                  onTap: () => Get.toNamed(Routes.FORGOT_NUMBER),
                )),
            Gap(26.h),
            Obx(() {
              return PrimaryButton(
                isLoading: controller.loginLoading.value,
                isExpanded: true,
                text: 'Login',
                onPressed: controller.isPhoneValidated.value
                    ? () => controller.sendOtp()
                    : null,
              );
            }),
            Gap(36.h),
            RichText(
              text: TextSpan(
                text: 'Belum punya akun? ',
                style: theme.font.f14,
                children: [
                  TextSpan(
                    text: 'Daftar',
                    style: theme.font.f14.copyWith(color: kInfoColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(Routes.REGISTER);
                      },
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

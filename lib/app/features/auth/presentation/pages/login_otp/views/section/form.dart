import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/login_otp/controllers/login_otp_controller.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginOtpController>(builder: (controller) {
      return Padding(
        padding: theme.style.padding.allLarge,
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    controller.otpControllers.length,
                    (index) => Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8.r, 0, 8.r, 0),
                            child: AppForm(
                              focusNode: controller.focusNodes[index],
                              controller: controller.otpControllers[index],
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  controller.listenForm(index, value),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ))),
            Gap(16.h),
            Obx(() => Center(
                  child: Column(
                    children: [
                      Visibility(
                          visible: controller.isCountdownSendOtpRun.value,
                          child: Text(controller.countdownSendOtp.value,
                              style: theme.font.f14.regular
                                  .copyWith(color: kSoftGrey))),
                      Visibility(
                          visible: !controller.isCountdownSendOtpRun.value,
                          child: GestureDetector(
                              onTap: () => controller.sendOtp(),
                              child: Text('Kirim Ulang',
                                  textAlign: TextAlign.center,
                                  style: theme.font.f14
                                      .copyWith(
                                          color: kInfoColor,
                                          decorationColor: kInfoColor)
                                      .underline)))
                    ],
                  ),
                )),
            Gap(26.h),
            PrimaryButton(
              isLoading: controller.isLoading,
              isExpanded: true,
              text: 'Lanjutkan',
              onPressed:
                  controller.enableButton ? () => controller.verifyOtp() : null,
            ),
          ],
        ),
      );
    });
  }
}

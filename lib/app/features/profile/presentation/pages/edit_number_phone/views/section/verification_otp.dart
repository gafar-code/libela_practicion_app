import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/edit_number_phone/controllers/edit_number_phone_controller.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/edit_number_phone/views/section/app_bar.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../core/components/components_lib.dart';

class VerificationOtp extends StatelessWidget {
  const VerificationOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNumberPhoneController>(builder: (controller) {
      return Scaffold(
        appBar: const AppBarEditNumberPhone(title: 'Masukkan Kode Otp'),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   controller.isLoading(false);
        // }),
        body: ListView(
          padding: theme.style.padding.allLarge,
          children: [
            Text('Kami telah mengirim kode OTP ke nomor Anda',
                style: theme.font.f14),
            Gap(16.h),
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
                              onTap: () =>
                                  controller.toVerifyOtp(isResend: true),
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
            Obx(() {
              return PrimaryButton(
                isLoading: controller.isLoading.value,
                isExpanded: true,
                text: 'Lanjut',
                onPressed: controller.enableButton
                    ? () => controller.verifyOtp()
                    : null,
              );
            }),
          ],
        ),
      );
    });
  }
}

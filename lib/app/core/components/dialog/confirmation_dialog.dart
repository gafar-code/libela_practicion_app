import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';

import '../../../config/theme/theme.dart';

class ConfirmationDialog {
  static void show(
      {required String title,
      required String message,
      String? onTapText,
      Function()? onPressed}) {
    Get.dialog(Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Container(
        padding: theme.style.padding.allLarge,
        decoration: BoxDecoration(
          borderRadius: theme.style.borderRadius.allMedium,
          color: kWhiteColor,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 320.w, minHeight: 100.w),
          child: SingleChildScrollView(
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  Text(
                    title,
                    style: theme.font.f14.semibold,
                  ),
                  Gap(6.h),
                  Text(
                    message,
                    style: theme.font.f14,
                  ),
                  Gap(26.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: getWidthScale(2.84),
                          child: SecondaryAccentButton(
                              text: "Batal", onPressed: () => Get.back())),
                      SizedBox(
                          width: getWidthScale(2.84),
                          child: PrimaryButton(
                              text: "Ya, $onTapText", onPressed: onPressed)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

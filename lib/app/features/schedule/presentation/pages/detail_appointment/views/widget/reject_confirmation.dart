import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/detail_appointment/controllers/detail_appointment_controller.dart';

import '../../../../../../../config/theme/theme.dart';

class ConfirmationReject {
  static void show() {
    Get.dialog(Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 32.w),
      child: GetBuilder<DetailAppointmentController>(builder: (controller) {
        return Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingin Menolak Permintaan Pasien?',
                      style: theme.font.f14.semibold,
                    ),
                    Gap(6.h),
                    Text(
                      'Berikan alasan penolakanmu untuk pasien:',
                      style: theme.font.f14,
                    ),
                    Gap(16.h),
                    Column(
                      children: List.generate(
                          controller.rejects.length,
                          (index) => Padding(
                              padding: theme.style.padding.bottomMedium,
                              child: GestureDetector(
                                onTap: () => controller.rejectReasonSelected(
                                    controller.rejects[index]),
                                child: Container(
                                  width: theme.style.fullWidth,
                                  color: kWhiteColor,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 18.r,
                                        width: 18.r,
                                        child: Transform.scale(
                                          scale: 1,
                                          child: Checkbox(
                                              value: controller.rejectReason ==
                                                  controller.rejects[index],
                                              activeColor: kInfoColor,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              visualDensity:
                                                  VisualDensity.compact,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          3.r)),
                                              side: BorderSide(
                                                  color: kSoftGrey, width: 1.2),
                                              onChanged: (value) => controller
                                                  .rejectReasonSelected(
                                                      controller
                                                          .rejects[index])),
                                        ),
                                      ),
                                      Gap(12.w),
                                      Text(
                                        index == 0
                                            ? 'Antrean Penuh'
                                            : 'Lainnya',
                                        style: theme.font.f14,
                                      )
                                    ],
                                  ),
                                ),
                              ))),
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
                            child:
                                PrimaryButton(text: "Kirim", onPressed: () {})),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    ));
  }
}

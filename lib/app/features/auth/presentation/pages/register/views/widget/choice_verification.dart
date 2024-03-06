import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/auth/presentation/pages/register/controllers/register_controller.dart';

import '../../../../../../../config/theme/colors.dart';

class ChoiceVerification extends StatelessWidget {
  const ChoiceVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
      return AppBottomSheet.witoutFooter(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pilih Metode pengiriman Kode Verifikasi',
              style: theme.font.f16.medium),
          Gap(12.h),
          RichText(
              text: TextSpan(
                  text: 'Pastikan nomor',
                  style: theme.font.f14.medium,
                  children: [
                TextSpan(
                    text: ' +62${controller.numberController.text} ',
                    style: theme.font.f14.bold),
                TextSpan(
                    text:
                        ' kamu sudah sesuai sebelum memilih metode pengiriman',
                    style: theme.font.f14.medium),
              ])),
          Gap(12.h),
          Column(
              children: List.generate(
                  controller.verificationMethode.length,
                  (index) => GestureDetector(
                        onTap: () => controller.selectVerification(index),
                        child: Container(
                          color: kWhiteColor,
                          height: 36.h,
                          width: getWidthScale(1),
                          child: Row(
                            children: [
                              LocalAssets.svg(controller
                                  .verificationMethode[index]['icon']),
                              Gap(12.w),
                              Text(
                                  controller.verificationMethode[index]
                                      ['title'],
                                  style: theme.font.f14.regular),
                              const Spacer(),
                              SizedBox(
                                height: 18.r,
                                width: 18.r,
                                child: Transform.scale(
                                  scale: 1,
                                  child: Checkbox(
                                      value: controller.selectedVerification ==
                                          index,
                                      activeColor: kInfoColor,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: VisualDensity.compact,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.r)),
                                      side: BorderSide(
                                          color: kSoftGrey, width: 1.2),
                                      onChanged: (value) =>
                                          controller.selectVerification(index)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))),
          Gap(32.h),
          PrimaryButton(
            isExpanded: true,
            text: 'Kirim Kode',
            onPressed: () => controller.sendOtp(),
          ),
          Gap(16.h),
          SecondaryAccentButton(
            isExpanded: true,
            text: 'Kembali',
            onPressed: () => Get.back(),
          )
        ],
      ));
    });
  }
}

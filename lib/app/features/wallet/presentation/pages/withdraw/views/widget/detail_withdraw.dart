import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/withdraw/controllers/withdraw_controller.dart';
import '../../../../../../../config/theme/theme.dart';

class DetailWithdraw extends StatelessWidget {
  const DetailWithdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawController>(builder: (controller) {
      return AppBottomSheet(
          isLoading: controller.isLoading,
          gapBottom: 72.h,
          textButton: 'Tarik Dana',
          onPressed: controller.amountController.text.isEmpty &&
                  controller.selectedBank == null
              ? null
              : () => controller.withdraw(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: getWidthScale(1),
                padding: theme.style.padding.allLarge,
                decoration: BoxDecoration(
                    borderRadius: theme.style.borderRadius.allMedium,
                    color: kSofterGrey),
                child: Column(children: [
                  Text('Nominal Penarikan', style: theme.font.f14.medium),
                  Gap(6.h),
                  Text('Rp.${controller.amountController.text}',
                      style: theme.font.f22.primary.semibold)
                ]),
              ),
              Gap(16.h),
              Text(
                'Transfer Ke',
                style: theme.font.f14.semibold,
              ),
              Gap(16.h),
              Visibility(
                visible: controller.selectedBank != null,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //     height: 32.h,
                    //     width: 56.w,
                    //     decoration: BoxDecoration(
                    //         borderRadius: theme.style.borderRadius.allSmall,
                    //         boxShadow: theme.style.shadow.small,
                    //         color: kWhiteColor)),
                    // Gap(12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: getWidthScale(1.6),
                          child: Text(controller.selectedBank?.bankAlias ?? '',
                              style: theme.font.f12),
                        ),
                        Gap(4.h),
                        Text(controller.selectedBank?.bankAccount ?? '',
                            style: theme.font.f12.semibold),
                        Text(controller.selectedBank?.bankAccountName ?? '',
                            style: theme.font.f12),
                      ],
                    )
                  ],
                ),
              ),
              Gap(16.h),
              Container(
                padding: theme.style.padding.allSmall,
                decoration: BoxDecoration(
                    color: kInfoColorAccent,
                    borderRadius: theme.style.borderRadius.allSmall),
                child: Row(children: [
                  Icon(Icons.info_rounded, color: kInfoColor, size: 14.r),
                  Gap(8.w),
                  Text(
                    'Dana kamu akan di proses dalam waktu 2 hari kerja',
                    style: theme.font.f12,
                  )
                ]),
              )
            ],
          ));
    });
  }
}

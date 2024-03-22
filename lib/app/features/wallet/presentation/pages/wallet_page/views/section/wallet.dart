import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/wallet_page/controllers/wallet_page_controller.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: GetBuilder<WalletPageController>(builder: (controller) {
      return Padding(
          padding: theme.style.padding.allLarge,
          child: Column(
            children: [
              Container(
                padding: theme.style.padding.allLarge,
                width: getWidthScale(1),
                decoration: BoxDecoration(
                    borderRadius: theme.style.borderRadius.allMedium,
                    gradient: LinearGradient(
                        colors: [kPrimaryColor, kPrimaryAccentColor2],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Saldo Kamu', style: theme.font.f12.white),
                        Gap(12.w),
                        GestureDetector(
                          onTap: () => controller.toggleHideSaldo(),
                          child: Icon(
                              controller.isHideSaldo
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 18.r,
                              color: kWhiteColor),
                        ),
                        Spacer(),
                        Text('Total Poin', style: theme.font.f12.white)
                      ],
                    ),
                    Gap(8.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              controller.isHideSaldo
                                  ? '************'
                                  : 'Rp. ${controller.wallet?.balance}',
                              style: theme.font.f24.white.bold),
                          Text('${controller.wallet?.point}',
                              style: theme.font.f20.white.semibold),
                        ])
                  ],
                ),
              ),
              Gap(12.h),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.WITHDRAW),
                child: Container(
                  height: 44.h,
                  width: getWidthScale(1),
                  decoration: BoxDecoration(
                      borderRadius: theme.style.borderRadius.allSmall,
                      color: kWhiteColor,
                      border: Border.all(color: kPrimaryColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: kPrimaryAccentColor2.withOpacity(0.3),
                        radius: 12.r,
                        child: Icon(
                          Icons.arrow_downward,
                          color: kPrimaryColor,
                          size: 14.r,
                        ),
                      ),
                      Gap(8.w),
                      Text('Tarik Dana', style: theme.font.f12)
                    ],
                  ),
                ),
              ),
              Gap(16.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Riwayat Withdraw',
                  style: theme.font.f14.semibold,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.HISTORY_WITHDRAW),
                  child: Text(
                    'Lihat semua',
                    style: theme.font.f12.blue,
                  ),
                )
              ]),
              Gap(12.h),
            ],
          ));
    }));
  }
}

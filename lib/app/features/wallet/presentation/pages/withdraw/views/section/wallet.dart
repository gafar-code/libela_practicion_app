import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/withdraw/controllers/withdraw_controller.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawController>(builder: (controller) {
      return Padding(
          padding: theme.style.padding.allLarge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Gap(16.h),
              Text('Nominal Penarikan', style: theme.font.f14),
              Gap(8.h),
              Container(
                width: getWidthScale(1),
                padding: theme.style.padding.horizontalMedium,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: theme.style.borderRadius.allSmall,
                    border: theme.style.boder),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Rp. 5000',
                    style: theme.font.f14.copyWith(color: kSoftGrey),
                  ),
                ),
              ),
              Gap(12.h),
              Row(
                children: [
                  Text('Insufficiens balance', style: theme.font.f12.red),
                  Spacer(),
                  Transform.scale(
                    scale: 0.5,
                    child: Switch(
                      value: controller.isSwitch,
                      onChanged: (value) => controller.toggleSwitch(),
                      activeColor: kWhiteColor,
                      trackOutlineColor: MaterialStatePropertyAll(
                          controller.isSwitch ? Colors.transparent : kSoftGrey),
                      trackColor: MaterialStatePropertyAll(
                          controller.isSwitch ? kPrimaryColor : kSofterGrey),
                    ),
                  ),
                  Text('Tarik Semua Saldo', style: theme.font.f12),
                ],
              ),
              Gap(12.h),
              Text('Biaya Admin', style: theme.font.f14),
              Gap(8.h),
              Container(
                width: getWidthScale(1),
                padding: theme.style.padding.horizontalMedium,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: theme.style.borderRadius.allSmall,
                    border: theme.style.boder),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Rp. 5000',
                    style: theme.font.f14.copyWith(color: kSoftGrey),
                  ),
                ),
              )
            ],
          ));
    });
  }
}

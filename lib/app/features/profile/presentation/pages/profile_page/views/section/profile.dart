import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/controllers/profile_page_controller.dart';

import '../../../../../../../config/theme/theme.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: getWidthScale(1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CardImage.circle(
                      size: 44.r,
                      image: controller.userProfileData?.avatar,
                    ),
                    Positioned(
                        bottom: -0.5,
                        right: -0.5,
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: kWhiteColor,
                          child: LocalAssets.svg(controller.userProfileData
                                      ?.isRegistrationComplete ==
                                  false
                              ? verifyBadge
                              : waitingBadge),
                        )),
                  ],
                ),
                Gap(16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        controller
                                .userProfileData?.professions?.professionName ??
                            '',
                        style: theme.font.f16.bold),
                    Gap(8.h),
                    Text(
                      'Skills',
                      style: theme.font.f14.regular,
                    ),
                    Gap(12.h),
                    SizedBox(
                      width: getWidthScale(1.6),
                      child: Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: List.generate(
                              controller.userProfileData
                                      ?.practititonerServiceSkill?.length ??
                                  0,
                              (index) => ConstrainedBox(
                                    constraints: BoxConstraints(
                                        minWidth: 5.w,
                                        maxWidth: getWidthScale(1)),
                                    child: Container(
                                      padding: theme.style.padding.allSmall
                                          .copyWith(top: 6.h, bottom: 6.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              theme.style.borderRadius.allLarge,
                                          color: kInfoColorAccent),
                                      child: Text(
                                          controller
                                                  .userProfileData
                                                  ?.practititonerServiceSkill?[
                                                      index]
                                                  .skills
                                                  ?.subProfessionName ??
                                              '',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.font.f10.blue),
                                    ),
                                  ))),
                    )
                  ],
                )
              ],
            ),
          ),
          Gap(16.h),
          Text('Tentang Saya', style: theme.font.f14.semibold),
          Gap(16.h),
          Container(
            padding: theme.style.padding.allMedium,
            decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allMedium,
                color: kWhiteColor,
                border: theme.style.boder),
            child: Text(
                controller.userProfileData?.professions?.professionName ?? '',
                style: theme.font.f14),
          ),
          Gap(16.h)
        ],
      );
    });
  }
}

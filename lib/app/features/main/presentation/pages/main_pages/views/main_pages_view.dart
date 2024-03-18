// ignore_for_file: sized_box_for_whitespace, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/features/profile/presentation/pages/profile_page/controllers/profile_page_controller.dart';

import '../controllers/main_pages_controller.dart';

class MainPagesView extends GetView<MainPagesController> {
  const MainPagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPagesController>(builder: (controller) {
      return Scaffold(
          body: IndexedStack(
            index: controller.currentPageIndex,
            children: controller.listPages,
          ),
          bottomNavigationBar: Container(
            height: 76.h,
            width: theme.style.fullWidth,
            padding: theme.style.padding.verticalSmall.copyWith(top: 12.h),
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: theme.style.borderRadius.topLarge,
                boxShadow: theme.style.shadow.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  controller.itemBar.length,
                  (index) => InkWell(
                        onTap: () => controller.changePage(index),
                        child: Container(
                          width: theme.style.fullWidth / 4,
                          child: _itemBar(
                            controller.itemBar[index]['icon'],
                            controller.itemBar[index]['label'],
                            controller.currentPageIndex == index,
                          ),
                        ),
                      )),
            ),
          ));
    });
  }

  Widget _itemBar(String icon, String label, bool isSelected,
      [String? image, String? status]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        label != 'Profile'
            ? LocalAssets.svg(icon,
                color: isSelected ? kPrimaryColor : kSoftGrey.withOpacity(0.5))
            : GetBuilder<ProfilePageController>(builder: (controller) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CardImage.circle(
                        size: 17.r,
                        image: controller.userProfileData?.avatar ?? ''),
                    Positioned(
                        top: -3,
                        right: -3,
                        child: LocalAssets.svg(
                            controller.userProfileData
                                        ?.isRegistrationComplete ==
                                    true
                                ? verifyBadge
                                : waitingBadge,
                            height: 14.h)),
                  ],
                );
              }),
        const Spacer(),
        Text(
          label,
          style: theme.font.f12.copyWith(
              color: isSelected ? kPrimaryColor : kSoftGrey.withOpacity(0.5),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal),
        ),
        Gap(4.h),
        Container(
          height: 2.h,
          width: MediaQuery.of(Get.context!).size.width / 8,
          color: isSelected ? kPrimaryColor : Colors.transparent,
        ),
      ],
    );
  }
}

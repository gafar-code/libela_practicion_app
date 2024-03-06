import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (controller) {
      return Scaffold(
          backgroundColor: kWhiteColor,
          appBar: AppBar(
            backgroundColor: kWhiteColor,
            title: LocalAssets.image(logoText, height: 31.h),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: controller.currentIndex == 1
                ? IconButton(
                    onPressed: () => controller.previous(),
                    icon:
                        Icon(Icons.arrow_back, size: 24.r, color: kBlackColor))
                : null,
          ),
          body: Padding(
            padding: theme.style.padding.allLarge,
            child: Column(
              children: [
                SizedBox(
                  height: getHeightScale(1.44),
                  width: getWidthScale(1),
                  child: PageView.builder(
                      controller: controller.pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.contentOnboarding.length,
                      onPageChanged: (value) => controller.changePage(value),
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            LocalAssets.image(controller.currentIndex == 0
                                ? onboarding1
                                : onboarding2),
                            Gap(16.h),
                            SizedBox(
                              width: getWidthScale(1),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      2,
                                      (index) => Padding(
                                            padding: EdgeInsets.only(
                                                right: index == 0 ? 6.w : 0),
                                            child: CircleAvatar(
                                              radius: 3.4.r,
                                              backgroundColor:
                                                  controller.currentIndex ==
                                                          index
                                                      ? kPrimaryColor
                                                      : kSofterGrey,
                                            ),
                                          ))),
                            ),
                            Gap(46.h),
                            Text(
                                controller.contentOnboarding[index].title ?? '',
                                style: theme.font.f16.semibold.black),
                            Gap(12.h),
                            Text(
                              controller.contentOnboarding[index].description ??
                                  '',
                              style: theme.font.f16.medium.black,
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      }),
                ),
                PrimaryButton(
                  isExpanded: true,
                  text: controller.currentIndex == 0
                      ? 'Mulai Sekarang'
                      : 'Lanjut',
                  onPressed: () => controller.next(),
                )
              ],
            ),
          ));
    });
  }
}

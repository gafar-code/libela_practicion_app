import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/schedule_page/controllers/schedule_page_controller.dart';

import '../../../../utils/enum.dart';

class AppBarSchedule extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedulePageController>(
        init: SchedulePageController(),
        builder: (controller) {
          return SliverAppBar(
            backgroundColor: kWhiteColor,
            surfaceTintColor: kWhiteColor,
            pinned: true,
            floating: true,
            elevation: 2,
            expandedHeight: 160.h,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jadwal', style: theme.font.f16.medium),
                Gap(3.h),
                Text('Lihat jadwal kunjunganmu di sini', style: theme.font.f14)
              ],
            ),
            actions: [LocalAssets.svg(notification), Gap(16.w)],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight + 34.h),
              child: Padding(
                padding: theme.style.padding.allLarge,
                child: Container(
                  height: 60.h,
                  padding: theme.style.padding.allSmall,
                  decoration: BoxDecoration(
                    color: kSofterGrey,
                    borderRadius: theme.style.borderRadius.allMedium,
                  ),
                  child: TabBar(
                      controller: controller.tabController,
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: kPrimaryAccentColor,
                      unselectedLabelColor: kSoftGrey,
                      labelColor: kWhiteColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabAlignment: TabAlignment.start,
                      indicator: BoxDecoration(
                          color: kPrimaryAccentColor2,
                          borderRadius: theme.style.borderRadius.allMedium),
                      tabs: ScheduleTab.values
                          .map((e) => Tab(
                                child: Text(
                                  e.name,
                                  style: theme.font.f12.copyWith(
                                      color:
                                          controller.currentIndexTab == e.index
                                              ? kWhiteColor
                                              : kSoftGrey),
                                ),
                              ))
                          .toList()),
                ),
              ),
            ),
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

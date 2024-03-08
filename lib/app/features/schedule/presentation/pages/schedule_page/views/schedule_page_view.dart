import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/schedule_page/views/section/app_bar.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/model/enum.dart';
import '../../../../../../config/theme/colors.dart';
import '../controllers/schedule_page_controller.dart';
import 'section/list_schedule.dart';

class SchedulePageView extends GetView<SchedulePageController> {
  const SchedulePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (_, isScroll) {
              return [
                AppBarSchedule(
                  controller: controller,
                )
              ];
            },
            body: TabBarView(
                controller: controller.tabController,
                children: List.generate(ScheduleTab.values.length, (index) {
                  return Obx(() {
                    if (!controller.loadingOnChangeTab.value) {
                      return ListSchedule(
                          tab: ScheduleTab.values[index],
                          controller: controller);
                    } else {
                      return SizedBox(
                        height: Get.height * 0.4,
                        child: Center(
                            child: CupertinoActivityIndicator(
                          color: kSoftGrey,
                        )),
                      );
                    }
                  });
                }))));
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/schedule_page/views/section/app_bar.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/enum.dart';

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
              return [AppBarSchedule()];
            },
            body: GetBuilder<SchedulePageController>(
                init: SchedulePageController(),
                builder: (controller) {
                  return TabBarView(
                      controller: controller.tabController,
                      children: ScheduleTab.values
                          .map((e) => ListSchedule(tab: e))
                          .toList());
                })));
  }
}

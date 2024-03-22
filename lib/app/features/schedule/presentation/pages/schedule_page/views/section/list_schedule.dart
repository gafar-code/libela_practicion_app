import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/schedule_page/controllers/schedule_page_controller.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/model/typedef.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../core/components/infiniti_page/infiniti_page.dart';
import '../../../../utils/model/enum.dart';
import '../widget/item_schedule.dart';

class ListSchedule extends StatelessWidget {
  const ListSchedule({super.key, required this.tab, required this.controller});

  final ScheduleTab tab;
  final SchedulePageController controller;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      controller: controller.refreshController[tab.index],
      onRefresh: controller.onRefresh,
      onLoading: controller.onLoading,
      header: WaterDropHeader(
        waterDropColor: kPrimaryColor,
        complete: SizedBox.shrink(),
        refresh: CupertinoActivityIndicator(
          color: kSoftGrey,
        ),
      ),
      child: GetBuilder<SchedulePageController>(builder: (controller) {
        return CustomScrollView(
          slivers: [
            // SliverPadding(
            //     padding: theme.style.padding.allLarge,
            //     sliver: PagedSliverList.separated(
            //         pagingController: controller.pagingController,
            //         builderDelegate: PagedChildBuilderDelegate<Appointment>(
            //           itemBuilder: (context, item, index) {
            //             return ItemSchedule(
            //               tab: tab,
            //               data: item,
            //               setReminder: () => controller.setReminder(
            //                   appointmentCode: item.appointmentCode ?? '',
            //                   activateReminder: item.setReminder ?? 0),
            //               toDetail: () => controller
            //                   .toDetailAppointment(item.appointmentCode ?? ''),
            //               confirmAppointment: () =>
            //                   controller.openDialogConfirmationAppointment(
            //                       item.appointmentCode ?? ''),
            //             );
            //           },
            //           newPageProgressIndicatorBuilder: InfinitiPage.progress,
            //           firstPageProgressIndicatorBuilder: InfinitiPage.progress,
            //           noItemsFoundIndicatorBuilder: (_) =>
            //               InfinitiPage.empty(_, 'Appointment'),
            //           firstPageErrorIndicatorBuilder: InfinitiPage.error,
            //         ),
            //         separatorBuilder: (_, i) => Gap(12.h))),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/features/home/presentation/pages/incoming_request/controllers/incoming_request_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/infiniti_page/infiniti_page.dart';
import '../../../../utils/models/typedef.dart';
import '../widget/item_appointment.dart';

class IncomingSection extends StatelessWidget {
  const IncomingSection({super.key, required this.controller});

  final IncomingRequestController controller;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      onLoading: controller.onLoading,
      header: WaterDropHeader(
        waterDropColor: kPrimaryColor,
        complete: SizedBox.shrink(),
        refresh: CupertinoActivityIndicator(
          color: kSoftGrey,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: theme.style.padding.allLarge,
            sliver: SliverToBoxAdapter(
              child: Row(children: [
                Text('Menunggu Persetujuan', style: theme.font.f14),
                Gap(8.w),
                CircleAvatar(
                  radius: 8.r,
                  backgroundColor: kPrimaryColor,
                  child: Obx(() {
                    return Text(
                      '${controller.waitingApprove.value}',
                      style: theme.font.f10.white,
                    );
                  }),
                )
              ]),
            ),
          ),
          SliverPadding(
              padding: theme.style.padding.allLarge,
              sliver: PagedSliverList.separated(
                  pagingController: controller.pagingController,
                  builderDelegate:
                      PagedChildBuilderDelegate<PendingAppointments>(
                    itemBuilder: (context, item, index) {
                      return ItemAppointment(data: item);
                    },
                    newPageProgressIndicatorBuilder: InfinitiPage.progress,
                    firstPageProgressIndicatorBuilder: InfinitiPage.progress,
                    noItemsFoundIndicatorBuilder: (_) =>
                        InfinitiPage.empty(_, 'Appointment'),
                    firstPageErrorIndicatorBuilder: InfinitiPage.error,
                  ),
                  separatorBuilder: (_, i) => Gap(12.h))),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/features/notification/presentation/pages/notification_page/controllers/notification_page_controller.dart';
import 'package:libela_practition/app/features/notification/presentation/pages/notification_page/views/widget/notification_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/infiniti_page/infiniti_page.dart';
import '../../../../utils/models/typedef.dart';

class ListNotification extends StatelessWidget {
  const ListNotification({super.key, required this.controller});

  final NotificationPageController controller;

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
              sliver: PagedSliverList.separated(
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<NotificationData>(
                    itemBuilder: (context, item, index) {
                      return NotificationItem(
                        data: item,
                        onTap: () => controller.toDetailAppointment(
                            type: item.notificationType ?? '',
                            appointmentId: item.referenceId ?? ''),
                      );
                    },
                    newPageProgressIndicatorBuilder: InfinitiPage.progress,
                    firstPageProgressIndicatorBuilder: InfinitiPage.progress,
                    noItemsFoundIndicatorBuilder: (_) =>
                        InfinitiPage.empty(_, 'Notification'),
                    firstPageErrorIndicatorBuilder: InfinitiPage.error,
                  ),
                  separatorBuilder: (_, i) => Gap(12.h))),
        ],
      ),
    );
  }
}

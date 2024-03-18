import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/features/home/presentation/pages/visit_is_over/controllers/visit_is_over_controller.dart';
import 'package:libela_practition/app/features/home/presentation/pages/visit_is_over/views/widget/item_visit.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/infiniti_page/infiniti_page.dart';
import '../../../../../../schedule/presentation/utils/model/typedef.dart';

class VisitSection extends StatelessWidget {
  const VisitSection({super.key, required this.controller});

  final VisitIsOverController controller;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: theme.style.padding.allLarge.copyWith(top: 0),
        sliver: PagedSliverList.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Appointment>(
              itemBuilder: (context, item, index) {
                return ItemVisit(
                  data: item,
                  onTap: () =>
                      controller.toDetailAppointment(item.appointmentCode),
                );
              },
              newPageProgressIndicatorBuilder: InfinitiPage.progress,
              firstPageProgressIndicatorBuilder: InfinitiPage.progress,
              noItemsFoundIndicatorBuilder: (_) =>
                  InfinitiPage.empty(_, 'Appointment'),
              firstPageErrorIndicatorBuilder: InfinitiPage.error,
            ),
            separatorBuilder: (_, i) => Gap(12.h)));
  }
}

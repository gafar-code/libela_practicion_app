import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/features/home/presentation/pages/visit_is_over/views/widget/item_visit.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

class VisitSection extends StatelessWidget {
  const VisitSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return ItemVisit(
            onTap: () => Get.toNamed(Routes.DETAIL_APPOINTMENT),
          );
        },
        separatorBuilder: (_, i) => Gap(12.h),
        itemCount: 3);
  }
}

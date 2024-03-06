import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/schedule/presentation/pages/schedule_page/views/section/search.dart';

import '../../../../utils/enum.dart';
import '../widget/item_schedule.dart';

class ListSchedule extends StatelessWidget {
  const ListSchedule({super.key, required this.tab});

  final ScheduleTab tab;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchSection(),
          ListView.separated(
              padding: theme.style.padding.allLarge,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return ItemSchedule(tab: tab);
              },
              separatorBuilder: (_, i) => Gap(16.h),
              itemCount: 10)
        ],
      ),
    );
  }
}

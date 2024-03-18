import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/features/home/presentation/pages/visit_is_over/controllers/visit_is_over_controller.dart';

import '../../../../../../../config/theme/colors.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VisitIsOverController>(builder: (controller) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: theme.style.padding.allLarge,
          child: Column(children: [
            AppForm(
              controller: controller.searchController,
              hintText: 'Cari...',
              onChanged: controller.searchPatient,
            ),
            Gap(12.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Lihat Berdasarkan', style: theme.font.f14),
              PopupMenuButton<String>(
                  color: kWhiteColor,
                  surfaceTintColor: kWhiteColor,
                  padding: theme.style.padding.horizontalMedium,
                  shadowColor: kBlackColor.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                      borderRadius: theme.style.borderRadius.allSmall),
                  itemBuilder: (BuildContext context) => List.generate(
                      controller.filters.length,
                      (index) => PopupMenuItem<String>(
                            value: controller.filters[index]['value'],
                            padding: theme.style.padding.horizontalMedium,
                            child: Text(
                              controller.filters[index]['filter'],
                              style: theme.font.f14,
                            ),
                          )),
                  onSelected: controller.filterByDate,
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: kSoftGrey,
                  ))
            ]),
            Gap(12.h)
          ]),
        ),
      );
    });
  }
}

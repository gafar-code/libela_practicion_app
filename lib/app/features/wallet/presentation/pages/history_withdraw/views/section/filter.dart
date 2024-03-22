import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/history_withdraw/controllers/history_withdraw_controller.dart';

import '../../../../../../../config/theme/colors.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: theme.style.padding.allLarge,
        child: GetBuilder<HistoryWithdrawController>(builder: (controller) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Lihat Berdasarkan', style: theme.font.f14.semibold),
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
                    onSelected: controller.filterByStatus,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kSoftGrey,
                    ))
              ]);
        }),
      ),
    );
  }
}

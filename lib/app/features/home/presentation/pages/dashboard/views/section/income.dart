import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../../../../../../core/utils/assets/assets.dart';
import '../../../../../../../core/utils/assets/local_assets.dart';
import 'cart.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Pendapatan',
            style: theme.font.f14.medium,
          ),
          const AppTextButton(
            text: '7 Hari Terakhir',
          )
        ]),
        Gap(12.h),
        const Visibility(visible: false, child: IncomeNotAvailable()),
        const Visibility(child: LineChartIncome())
      ],
    );
  }
}

class IncomeNotAvailable extends StatelessWidget {
  const IncomeNotAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.style.padding.allLarge,
      width: theme.style.fullWidth,
      height: 130.h,
      decoration: BoxDecoration(
          color: kSofterGrey, borderRadius: theme.style.borderRadius.allMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LocalAssets.svg(chart),
          Gap(12.h),
          Text(
            'Oops! Data belum tersedia',
            style: theme.font.f12,
          )
        ],
      ),
    );
  }
}

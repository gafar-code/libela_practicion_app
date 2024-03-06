import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/enum.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/badge/app_badge.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../../../../../../core/utils/assets/assets.dart';
import '../../../../../../../core/utils/assets/local_assets.dart';

class ItemSchedule extends StatelessWidget {
  const ItemSchedule({super.key, required this.tab});

  final ScheduleTab tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.style.padding.allMedium,
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: theme.style.shadow.softCard,
        border: Border(
          left: BorderSide(color: colorSideBorder, width: 2),
          top: BorderSide(color: kBorder),
          right: BorderSide(color: kBorder),
          bottom: BorderSide(color: kBorder),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Waktu Kunjungan',
            style: theme.font.f12.copyWith(color: kSoftGrey),
          ),
          Gap(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      LocalAssets.svg(dateSchadule, color: kSoftGrey),
                      Gap(8.w),
                      Text('Jum, 19 Sep 2024', style: theme.font.f12)
                    ],
                  ),
                  Gap(6.h),
                  Row(
                    children: [
                      LocalAssets.svg(time, color: kSoftGrey),
                      Gap(8.w),
                      Text('09.00 - 10.00', style: theme.font.f12)
                    ],
                  )
                ],
              ),
              _trailing(tab)
            ],
          ),
          Gap(16.h),
          Divider(
            color: kBorder,
            height: 0,
            thickness: 1.2,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CardImage.circle(
              size: 22.r,
              image:
                  'https://plus.unsplash.com/premium_photo-1708274146108-db9aff3cb6ce?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            title: Text('John Doe', style: theme.font.f12),
            subtitle: Text('Jl. Semesta B12, Bogor barat',
                style: theme.font.f12.copyWith(color: kSoftGrey)),
          )
        ],
      ),
    );
  }

  Color get colorSideBorder {
    switch (tab) {
      case ScheduleTab.coming:
        return kInfoColor;
      case ScheduleTab.finished:
        return kSuccessColor;
      case ScheduleTab.rejected:
        return kErrorColor;
      default:
        return kWarningColor;
    }
  }

  Widget _trailing(ScheduleTab tab) {
    switch (tab) {
      case ScheduleTab.all:
        return _coming();
      case ScheduleTab.coming:
        return AppBadge(text: 'Dikonfirmasi');
      case ScheduleTab.finished:
        return AppBadge(
          text: 'Kunjungan Selesai',
          type: AppBadgeType.success,
        );
      case ScheduleTab.rejected:
        return AppBadge(text: 'Ditolak', type: AppBadgeType.error);
      default:
        return SizedBox.shrink();
    }
  }

  Widget _coming() {
    return Container(
      padding: theme.style.padding.allMedium,
      decoration: BoxDecoration(
          borderRadius: theme.style.borderRadius.allSmall,
          color: kWhiteColor,
          border: Border.all(color: kInfoColor, width: 1.2)),
      child: Center(
        child: Text(
          'Konfirmasi Kedatangan',
          style: theme.font.f12.copyWith(color: kInfoColor).medium,
        ),
      ),
    );
  }
}

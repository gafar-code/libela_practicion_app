import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/utils/extension/convert_local.dart';
import 'package:libela_practition/app/features/schedule/presentation/utils/model/enum.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/badge/app_badge.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../../../../../../core/utils/assets/assets.dart';
import '../../../../../../../core/utils/assets/local_assets.dart';
import '../../../../utils/model/typedef.dart';

class ItemSchedule extends StatelessWidget {
  const ItemSchedule(
      {super.key,
      required this.tab,
      required this.data,
      this.setReminder,
      this.toDetail,
      this.confirmAppointment});

  final ScheduleTab tab;
  final Appointment data;
  final Function()? setReminder;
  final Function()? toDetail;
  final Function()? confirmAppointment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toDetail,
      child: Container(
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
                        Text("${data.startAt?.convertToLocaleDay}",
                            style: theme.font.f12)
                      ],
                    ),
                    Gap(6.h),
                    Row(
                      children: [
                        LocalAssets.svg(time, color: kSoftGrey),
                        Gap(8.w),
                        Text(
                            '${data.startAt?.convertToLocaleTime} - ${data.endAt?.convertToLocaleTime}',
                            style: theme.font.f12)
                      ],
                    )
                  ],
                ),
                _trailing(data.status ?? '')
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
                image: data.patient?.avatar ?? '',
              ),
              title: Text(data.patient?.name ?? '', style: theme.font.f12),
              subtitle: Text(data.patient?.address ?? '',
                  style: theme.font.f12.copyWith(color: kSoftGrey)),
              trailing: Visibility(
                  visible: data.status == 'assinged',
                  child: GestureDetector(
                      onTap: setReminder,
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: kSofterGrey,
                        child: LocalAssets.svg(reminder,
                            color: data.setReminder == 1
                                ? kPrimaryColor
                                : kSoftGrey.withOpacity(0.4)),
                      ))),
            )
          ],
        ),
      ),
    );
  }

  Color get colorSideBorder {
    switch (data.status) {
      case 'assinged':
        return kInfoColor;
      case 'finish':
        return kSuccessColor;
      case 'cancel':
        return kErrorColor;
      default:
        return kWarningColor;
    }
  }

  Widget _trailing(String status) {
    switch (status) {
      case 'assinged':
        return AppBadge(text: 'Dikonfirmasi');
      case 'in_progress':
        return _coming();
      case 'finish':
        return AppBadge(
          text: 'Kunjungan Selesai',
          type: AppBadgeType.success,
        );
      case 'cancel':
        return AppBadge(text: 'Ditolak', type: AppBadgeType.error);
      default:
        return SizedBox.shrink();
    }
  }

  Widget _coming() {
    return GestureDetector(
      onTap: confirmAppointment,
      child: Container(
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
      ),
    );
  }
}

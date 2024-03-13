import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/utils/extension/convert_local.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/utils/assets/assets.dart';
import '../../../../../../../core/utils/assets/local_assets.dart';
import '../../../../utils/models/typedef.dart';

class ItemAppointment extends StatelessWidget {
  const ItemAppointment({super.key, required this.data});

  final PendingAppointments data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: theme.style.padding.allMedium,
      decoration: BoxDecoration(
          color: kSofterGrey, borderRadius: theme.style.borderRadius.allMedium),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(
          radius: 18.r,
          backgroundColor: kPrimaryAccentColor,
          child: LocalAssets.svg(schadule, height: 14.r, color: kWhiteColor),
        ),
        Gap(12.w),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Permintaan kunjungan untuk tanggal:', style: theme.font.f14),
          Gap(3.h),
          Text(
              'Senin, ${data.apStartAt?.convertToLocaleDate} ~  ${data.apStartAt?.convertToLocaleTime} -  ${data.apStartAt?.convertToLocaleTime}',
              style: theme.font.f14.semibold),
          Gap(10.h),
          Text('Lihat selengkapnya..', style: theme.font.f14.blue),
        ])
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';

import '../../../../../../../config/theme/colors.dart';

class IncomingSection extends StatelessWidget {
  const IncomingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: theme.style.padding.allLarge,
      children: [
        Row(children: [
          Text('Menunggu Persetujuan', style: theme.font.f14),
          Gap(8.w),
          CircleAvatar(
            radius: 8.r,
            backgroundColor: kPrimaryColor,
            child: Text(
              '3',
              style: theme.font.f10.white,
            ),
          )
        ]),
        Gap(16.h),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return Container(
                padding: theme.style.padding.allMedium,
                decoration: BoxDecoration(
                    color: kSofterGrey,
                    borderRadius: theme.style.borderRadius.allMedium),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18.r,
                        backgroundColor: kPrimaryAccentColor,
                        child: LocalAssets.svg(schadule,
                            height: 14.r, color: kWhiteColor),
                      ),
                      Gap(12.w),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Permintaan kunjungan untuk tanggal:',
                                style: theme.font.f14),
                            Gap(3.h),
                            Text('Senin, 28 Maret 2024 ~ 09.00 - 10.00',
                                style: theme.font.f14.semibold),
                            Gap(10.h),
                            Text('Lihat selengkapnya..',
                                style: theme.font.f14.blue),
                          ])
                    ]),
              );
            },
            separatorBuilder: (_, i) => Gap(12.h),
            itemCount: 3),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';

import '../../../../../../../config/theme/colors.dart';
import '../../../../../../../config/theme/theme.dart';

class ItemVisit extends StatelessWidget {
  const ItemVisit({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: theme.style.padding.allMedium,
        decoration: BoxDecoration(
            borderRadius: theme.style.borderRadius.allSmall,
            color: kSuccessAccentColor),
        child: Row(
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pasien',
                          style: theme.font.f12.copyWith(color: kSoftGrey)),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 6.r,
                            backgroundColor: kSuccessColor,
                            child: Icon(Icons.check,
                                size: 10.r, color: kWhiteColor),
                          ),
                          Gap(4.w),
                          Text(
                            'Selesai',
                            style: theme.font.f12.green,
                          )
                        ],
                      ),
                    ],
                  ),
                  Gap(4.h),
                  Text('Zara Samantha', style: theme.font.f12.semibold),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tanggal Lahir',
                          style: theme.font.f12.copyWith(color: kSoftGrey)),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: kInfoColor,
                        size: 16.r,
                      )
                    ],
                  ),
                  Gap(4.h),
                  Text('19/10/1989', style: theme.font.f12.semibold),
                ])),
          ],
        ),
      ),
    );
  }
}

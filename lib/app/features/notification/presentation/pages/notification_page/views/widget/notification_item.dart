import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/extension/convert_local.dart';
import 'package:libela_practition/app/features/notification/presentation/utils/models/typedef.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.data, this.onTap});

  final NotificationData data;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: theme.style.padding.allMedium,
        decoration: BoxDecoration(
          color: kSofterGrey,
          borderRadius: theme.style.borderRadius.allMedium,
        ),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: kPrimaryAccentColor2,
                child:
                    Icon(Icons.notifications, color: kWhiteColor, size: 24.r),
              ),
            ),
            Gap(12.w),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.notification?.content ?? '',
                        style: theme.font.f12.semibold),
                    Gap(4.h),
                    Text("${data.createdAt?.convertToLocaleTime}",
                        style: theme.font.f12.copyWith(color: kSoftGrey)),
                  ]),
            ),
            Icon(Icons.chevron_right_rounded, color: kSoftGrey)
          ],
        ),
      ),
    );
  }
}

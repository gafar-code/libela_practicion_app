import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: theme.style.borderRadius.bottomMedium,
            child: LocalAssets.image(loginImage)),
        Padding(
            padding: theme.style.padding.allLarge.copyWith(bottom: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('No. HP Baru', style: theme.font.f20.semibold),
                Gap(6.h),
                Text('Silakan masukan nomor HP baru untuk akun Anda',
                    style: theme.font.f16.regular)
              ],
            ))
      ],
    );
  }
}

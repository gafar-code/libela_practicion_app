// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';

import '../../../../../../../config/theme/theme.dart';
import '../../../../../../../core/components/components_lib.dart';
import '../../../../../../../core/utils/assets/assets.dart';
import '../../../../../../../core/utils/assets/local_assets.dart';
import '../../../../../../../routes/app_pages.dart';

class VerificationEmail extends StatelessWidget {
  const VerificationEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.MAIN_PAGES);
        return false;
      },
      child: Scaffold(
          body: SafeArea(
        child: ListView(
          padding: theme.style.padding.allLarge,
          children: [
            Gap(100.h),
            LocalAssets.image(emailVerification, height: 174.h),
            Gap(32.h),
            Text(
              'Verifikasi Email',
              style: theme.font.f16.semibold,
              textAlign: TextAlign.center,
            ),
            Gap(12.h),
            Text(
              'Silakan cek email untuk melakukan verifikasi',
              style: theme.font.f14,
              textAlign: TextAlign.center,
            ),
            Gap(28.h),
            Center(
              child: AppTextButton(
                onTap: () => Get.offAllNamed(Routes.MAIN_PAGES),
                text: 'Kembali ke Beranda',
              ),
            )
          ],
        ),
      )),
    );
  }
}

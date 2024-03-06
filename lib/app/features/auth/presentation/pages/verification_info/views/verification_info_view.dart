import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

import '../controllers/verification_info_controller.dart';

class VerificationInfoView extends GetView<VerificationInfoController> {
  const VerificationInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: theme.style.padding.allLarge,
        children: [
          Gap(100.h),
          LocalAssets.image(waitingVerification, height: 174.h),
          Gap(32.h),
          Text(
            'Verifikasi Sedang Diproses',
            style: theme.font.f16.semibold,
            textAlign: TextAlign.center,
          ),
          Gap(12.h),
          Text(
            'Mohon menunggu proses verifikasi oleh Admin.',
            style: theme.font.f14,
            textAlign: TextAlign.center,
          ),
          Gap(28.h),
          Center(
            child: AppTextButton(
              onTap: () => Get.offAllNamed(Routes.MAIN_PAGES),
              text: 'Lanjut ke Beranda',
            ),
          )
        ],
      ),
    ));
  }
}

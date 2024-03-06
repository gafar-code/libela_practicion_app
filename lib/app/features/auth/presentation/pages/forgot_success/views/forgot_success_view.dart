import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/routes/app_pages.dart';

import '../../../../../../config/theme/theme.dart';
import '../../../../../../core/components/components_lib.dart';
import '../../../../../../core/utils/assets/assets.dart';
import '../../../../../../core/utils/assets/local_assets.dart';
import '../controllers/forgot_success_controller.dart';

class ForgotSuccessView extends GetView<ForgotSuccessController> {
  const ForgotSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: theme.style.padding.allLarge,
        children: [
          Gap(100.h),
          LocalAssets.image(successChange, height: 174.h),
          Gap(32.h),
          Text(
            'No. HP Berhasil Diubah',
            style: theme.font.f16.semibold,
            textAlign: TextAlign.center,
          ),
          Gap(12.h),
          Text(
            'Silakan login kembali ke akun Anda.',
            style: theme.font.f14,
            textAlign: TextAlign.center,
          ),
          Gap(28.h),
          PrimaryButton(
            text: 'Login',
            onPressed: () => Get.offAllNamed(Routes.LOGIN),
          )
        ],
      ),
    ));
  }
}

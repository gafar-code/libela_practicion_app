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

import '../controllers/waiting_withdraw_controller.dart';
import 'section/app_bar.dart';

class WaitingWithdrawView extends GetView<WaitingWithdrawController> {
  const WaitingWithdrawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWaitingWithdraw(),
        body: Padding(
          padding: theme.style.padding.allLarge,
          child: Column(children: [
            Gap(16.h),
            LocalAssets.svg(clockCountdown, height: 98.h),
            Gap(26.h),
            Text('Penarikan Menunggu Persetujuan',
                style: theme.font.f18.semibold, textAlign: TextAlign.center),
            Gap(8.h),
            Text(
                'Mohon menunggu, pengajuan sedang dalam proses. Maksimal 2 hari kerja',
                style: theme.font.f14,
                textAlign: TextAlign.center),
            Gap(26.h),
            PrimaryButton(
              text: 'Lihat Riwayat Withdraw',
              onPressed: () => Get.offNamed(Routes.HISTORY_WITHDRAW),
            )
          ]),
        ));
  }
}

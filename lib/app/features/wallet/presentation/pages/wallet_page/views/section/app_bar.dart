import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/features/wallet/presentation/pages/wallet_page/controllers/wallet_page_controller.dart';
import '../../../../../../../routes/app_pages.dart';

class AppBarWallet extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWallet({Key? key, required this.controller}) : super(key: key);

  final WalletPageController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      surfaceTintColor: kWhiteColor,
      elevation: 2,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Wallet', style: theme.font.f16.medium),
          Gap(3.h),
          Text('Ajukan withdraw dengan mudah', style: theme.font.f14)
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () => Get.toNamed(Routes.NOTIFICATION_PAGE),
          child: LocalAssets.svg(notification),
        ),
        Gap(16.w)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

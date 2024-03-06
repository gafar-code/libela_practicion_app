import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/core/components/components_lib.dart';
import 'package:libela_practition/app/core/utils/assets/assets.dart';
import 'package:libela_practition/app/core/utils/assets/local_assets.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/home/presentation/pages/form_action/views/section/app_bar.dart';
import 'package:libela_practition/app/features/home/presentation/pages/form_action/views/section/score.dart';

import '../../../../../../config/theme/theme.dart';
import '../controllers/form_action_controller.dart';
import 'section/button.dart';
import 'section/form.dart';

class FormActionView extends GetView<FormActionController> {
  const FormActionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 2,
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          if (index == 0) {
            return Scaffold(
              appBar: const AppBarFormAction(),
              body: ListView(
                padding: theme.style.padding.allLarge,
                children: const [ScoreSection(), FormSection()],
              ),
              bottomNavigationBar: const ButtonSection(),
            );
          } else {
            return SuccessWidget(controller: controller);
          }
        });
  }
}

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key, required this.controller});

  final FormActionController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInfoColorAccent,
      body: Padding(
        padding: theme.style.padding.allLarge,
        child: Column(
          children: [
            Gap(130.h),
            Container(
              padding: theme.style.padding.allLarge,
              width: getWidthScale(1),
              decoration: BoxDecoration(
                borderRadius: theme.style.borderRadius.allMedium,
                color: kWhiteColor,
              ),
              child: Column(
                children: [
                  LocalAssets.image(doctorImage, height: 180.h),
                  Gap(26.h),
                  Text('Sesi Kunjungan Selesai',
                      style: theme.font.f16.semibold),
                  Gap(12.h),
                  Text('Saldo telah ditambahkan ke akunmu sebesar ',
                      style: theme.font.f14),
                  Gap(12.h),
                  Text('Rp500.000',
                      style: theme.font.f20.bold.copyWith(color: kInfoColor)),
                  Gap(26.h),
                  PrimaryButton(
                      isExpanded: true, text: 'Lihat Saldo', onPressed: () {}),
                  Gap(16.h),
                  GestureDetector(
                      child: Text(
                    'Lihat Detail Appointment',
                    style: theme.font.f14.copyWith(color: kSuccessColor),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
